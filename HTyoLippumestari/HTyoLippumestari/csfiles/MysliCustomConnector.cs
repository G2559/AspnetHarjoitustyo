using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace HTyoLippumestari
{
    public class MysliCustomConnector
    {
        public MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["mysli2conn"].ToString());
        MySqlCommand command = new MySqlCommand();
        MySqlDataAdapter adapter;

        //Konstruktori
        public MysliCustomConnector()
        {
            //Konstruktor
        }

        //Destruktori
        ~MysliCustomConnector()
        {
            //Destructori
        }

        //Yhteyden avaus
        public void OpenConnection()
        {
            try
            {
                connection.Open();
            }
            catch (Exception)
            {
                HttpContext.Current.Trace.Write("Joku meni vikaan :(");
            }

        }

        //Yhteyden sulku
        public void CloseConnection()
        {
            connection.Close();
        }

        //Varmistaa ettei käyttäjää ole jo olemassa, palauttaa true tai falsen
        public bool VerifyUserNotDuplicate(string username)
        {
            try
            {
                command.Connection = connection;
                command.CommandText = "SELECT COUNT(*) FROM Users WHERE username='" + username + "'";

                object result = command.ExecuteScalar();
                if (result != null)
                {
                    int r = Convert.ToInt32(result);

                    if (r != 1)
                    {
                        return true;
                    }
                    else return false;
                }
                else return false;
            }
            catch (Exception)
            {
                return false;
                throw;
            }

        }

        //Luo käyttäjän ja palauttaa truen, mikäli poikkeuksia ei synny
        public bool CreateUser(string username, string password, string firstname, string lastname, string address,
        string postalcode, string city, string puhnro, string email)
        {
            try
            {
                command.Connection = connection;
                command.CommandText = "INSERT INTO Users (username, password, firstname, lastname, address, postalcode, city, phone, email) VALUES(@tunn,@pass,@etun,@sukun,@osot,@post,@postpaik,@puhnro,@email)";

                command.Parameters.AddWithValue("@tunn", username);
                command.Parameters.AddWithValue("@pass", password);
                command.Parameters.AddWithValue("@etun", firstname);
                command.Parameters.AddWithValue("@sukun", lastname);
                command.Parameters.AddWithValue("@osot", address);
                command.Parameters.AddWithValue("@post", postalcode);
                command.Parameters.AddWithValue("@postpaik", city);
                command.Parameters.AddWithValue("@puhnro", puhnro);
                command.Parameters.AddWithValue("@email", email);

                MySqlDataReader reader = command.ExecuteReader();

                try
                {
                    reader.Read();
                    reader.Close();
                    return true;
                }
                catch (Exception) { HttpContext.Current.Trace.Write("Joku meni vikaan :("); reader.Close(); return false; throw; }

            }
            catch (Exception) { HttpContext.Current.Trace.Write("Joku meni vikaan :("); return false; throw; }
        }

        //Luo Tapahtuman
        public void CreateEvent(string TODO)
        {
            //TODO
        }

        //Muokkaa tapahtumaa
        public void ModifyEvent()
        {
        }

        //Tilauksen luominen
        public void MakeOrder()
        {
        }

        //Tilausten selailu
        public void BrowseOrders()
        {
        }

        //Kirjautumisen varmistus, palauttaa booleanin onnistumisesta
        public bool VerifyLogin(string username, string password)
        {
            
            string hashedpasswd = SimpleHash.ComputeHash(password, "SHA512", ConfigurationManager.AppSettings["salt"]);

            try
            {
                command.Connection = connection;
                command.CommandText = "SELECT COUNT(*) FROM Users WHERE username='" + username + "'" + " AND " + "password='" + hashedpasswd + "'";

                object result = command.ExecuteScalar();
                if (result != null)
                {
                    int r = Convert.ToInt32(result);

                    if (r == 1)
                    {
                        return true;
                    }
                    else return false;
                }
                else return false;
            }
            catch (Exception)
            {
                HttpContext.Current.Trace.Write("Joku meni vikaan :(");
                return false;
                throw;
            }
            
        }

        //Hakee tapahtuman kategorian mukaan ja palauttaa sen datasettinä
        public DataSet GetdDatasetOfEventsByCategory(string category)
        {
            string sql = "SELECT eventID, Events.venueID, eventname, venuename, date, description, agelimit FROM Events, Venue WHERE category='" + category + "' AND  Events.venueID = Venue.venueID ORDER by date asc";
            adapter = new MySqlDataAdapter(sql, connection);
            MySqlCommandBuilder cb = new MySqlCommandBuilder(adapter);

            DataSet dsCategory = new DataSet();
            adapter.Fill(dsCategory, "Events");

            return dsCategory;
        }

        public DataSet GetAllEvents()
        {
            string sql = "SELECT eventID, Events.venueID, eventname, venuename, date, description, agelimit FROM Events, Venue WHERE Events.venueID = Venue.venueID ORDER by date asc";
            adapter = new MySqlDataAdapter(sql, connection);
            MySqlCommandBuilder cb = new MySqlCommandBuilder(adapter);

            DataSet dsCategory = new DataSet();
            adapter.Fill(dsCategory, "Events");

            return dsCategory;
        }

        //Hakee käyttäjän tiedot datasettinä
        public DataSet GetUserDetails(string username)
        {
            string sql = "SELECT userID, username, password, firstname, lastname, address, postalcode, city, phone, email FROM Users WHERE username='" + username + "'";
            adapter = new MySqlDataAdapter(sql, connection);
            MySqlCommandBuilder cb = new MySqlCommandBuilder(adapter);

            DataSet userset = new DataSet();
            adapter.Fill(userset, "Users");

            return userset;
        }

        //Päivittää käyttäjän tiedot
        public void UpdateUserDetails(string username, string password,string firstname, string lastname, string address,
        string postalcode, string city, string puhnro, string email, string userid)
        {
            string hashedpasswd = SimpleHash.ComputeHash(password, "SHA512", ConfigurationManager.AppSettings["salt"]);
            int userId = Int32.Parse(userid);

            try
            {
                command.Connection = connection;
                command.CommandText = "UPDATE Users SET username=@tunn, password=@pass, firstname=@etun, lastname=@sukun, address=@osot, postalcode=@post, city=@postpaik, phone=@puhnro, email=@email WHERE userID=@userID";

                command.Parameters.AddWithValue("@tunn", username);
                command.Parameters.AddWithValue("@pass", hashedpasswd);
                command.Parameters.AddWithValue("@etun", firstname);
                command.Parameters.AddWithValue("@sukun", lastname);
                command.Parameters.AddWithValue("@osot", address);
                command.Parameters.AddWithValue("@post", postalcode);
                command.Parameters.AddWithValue("@postpaik", city);
                command.Parameters.AddWithValue("@puhnro", puhnro);
                command.Parameters.AddWithValue("@email", email);
                command.Parameters.AddWithValue("@userID", userId);

                MySqlDataReader reader = command.ExecuteReader();

                try
                {
                    reader.Read();
                    reader.Close();
                }
                catch (Exception) { HttpContext.Current.Trace.Write("Joku meni vikaan :("); reader.Close(); throw; }

            }
            catch (Exception) { HttpContext.Current.Trace.Write("Joku meni vikaan :("); throw; }
        }
    }
}