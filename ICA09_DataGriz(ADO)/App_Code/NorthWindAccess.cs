using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for NorthWindAccess
/// </summary>
public class NorthWindAccess
{
    public NorthWindAccess()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static string InsertOrderDetails(int oid,int pid, short quantity)
    {
        string message;

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["wcho2_Northwind_CS"].ConnectionString))
        {
                conn.Open();
            using (SqlCommand command = new SqlCommand("InsertOrderDetails", conn))
            {
               
                command.CommandType = System.Data.CommandType.StoredProcedure;
               

                SqlParameter param = new SqlParameter("@orderID", oid);
                param.SqlDbType = System.Data.SqlDbType.Int;
                param.Direction = System.Data.ParameterDirection.Input;
                command.Parameters.Add(param);

                param = new SqlParameter("@productID", pid);
                param.SqlDbType = System.Data.SqlDbType.Int;
                param.Direction = System.Data.ParameterDirection.Input;
                command.Parameters.Add(param);

                param = new SqlParameter("@quantity", quantity);
                param.SqlDbType = System.Data.SqlDbType.SmallInt;
                param.Direction = System.Data.ParameterDirection.Input;
                command.Parameters.Add(param);

                // output need to be set the size
                param = new SqlParameter();
                param.ParameterName = "@returnval";
                param.SqlDbType = System.Data.SqlDbType.Int;
                param.Direction = System.Data.ParameterDirection.ReturnValue;
                command.Parameters.Add(param);

                try
                {
                    command.ExecuteNonQuery();
                }
                catch (Exception e)
                {
                    System.Diagnostics.Debug.WriteLine(e.Message);
                }


                return command.Parameters["@returnval"].Value.ToString();


            }
        }
        return message;
    }
    public static string DeleteOrderDetails(int oid, int pid)
    {
        string message;

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["wcho2_Northwind_CS"].ConnectionString))
        {
            using (SqlCommand command = new SqlCommand())
            {
                conn.Open();
                command.Connection = conn;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "DeleteOrderDetails";
                //setup the sp parameter
                SqlParameter oidParam = new SqlParameter("@OrderID", System.Data.SqlDbType.Int);
                oidParam.Value = oid;
                oidParam.Direction = System.Data.ParameterDirection.Input;
                command.Parameters.Add(oidParam);

                //setup the sp parameter
                SqlParameter pidParam = new SqlParameter("@ProductID", System.Data.SqlDbType.Int);
                pidParam.Value = pid;
                pidParam.Direction = System.Data.ParameterDirection.Input;
                command.Parameters.Add(pidParam);

                //setup the sp parameter
                SqlParameter messageParam = new SqlParameter("@Message", System.Data.SqlDbType.VarChar,80);
                messageParam.Value = "";
                messageParam.Direction = System.Data.ParameterDirection.Output;
                command.Parameters.Add(messageParam);

                //now execute then assgin the message

                command.ExecuteNonQuery();
                message = command.Parameters["@Message"].Value.ToString();
               // message = messageParam.Value.ToString();


            }
        }
        return message;
    }
    //ICA12
    public static SqlDataReader CustomerCategorySummary(string customerID)
    {
        SqlDataReader reader = null;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["wcho2_Northwind_CS"].ConnectionString);

        conn.Open();

        using (SqlCommand command = new SqlCommand())
        {
            command.Connection = conn;
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = "CustCatSummary";

            SqlParameter filterParam = new SqlParameter("@CustomerID", System.Data.SqlDbType.Char);
            filterParam.Value = customerID;
            filterParam.Direction = System.Data.ParameterDirection.Input;
            command.Parameters.Add(filterParam);
            reader = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }
            
            return reader;
        
           
    }
    //ica12
    public static void FillCustomersDDL(string filter, DropDownList ddl)
    {
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["wcho2_Northwind_CS"].ConnectionString))
        {
            using (SqlCommand command = new SqlCommand())
            {
                conn.Open();
                command.Connection = conn;
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.CommandText = "GetCustomers";
                //setup the sp parameter
                SqlParameter filterParam = new SqlParameter("@Filter",System.Data.SqlDbType.VarChar);
                filterParam.Value = filter;
                filterParam.Direction = System.Data.ParameterDirection.Input;
                command.Parameters.Add(filterParam);
                // fill the ddl
                ddl.DataSource = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                ddl.DataTextField = "CompanyName";
                ddl.DataValueField = "CustomerID";
                ddl.Items.Clear();
                ddl.DataBind();
                ddl.AppendDataBoundItems = true;
                ddl.Items.Insert(0, new ListItem("Now Pick a Customer from[" +ddl.Items.Count +"]"));



            }
        }
    }
    public static SqlDataSource GetSuppliersSDS(string compnayNameFragmnet)
    {
        string query = "SELECT CompanyName, SupplierID FROM Suppliers";
        if (compnayNameFragmnet != null)
            query += " WHERE CompanyName LIKE '%" + compnayNameFragmnet + "%'";

        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = ConfigurationManager.ConnectionStrings["wcho2_Northwind_CS"].ConnectionString;
        sds.SelectCommand = query;

        return sds;

    }
    public static List<List<string>> GetProducts(string supplierID)
    {
        List<List<string>> products = new List<List<string>>();
        if (supplierID == null) return products;

        string query = "SELECT ProductName, QuantityPerUnit,UnitsInStock";
        query += " FROM Products";
        query += " WHERE SupplierID = " + supplierID;
        query += " ORDER BY ProductName ASC";

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["wcho2_Northwind_CS"].ConnectionString))
        {
            using (SqlCommand command = new SqlCommand(query, conn))
            {
                conn.Open();
                SqlDataReader reader = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                if (!reader.HasRows) return products;

                int fieldCnt = reader.FieldCount;
                List<string> headings = new List<string>(fieldCnt);

                for(int i =0; i< fieldCnt; ++i)
                {
                    headings.Add(reader.GetName(i));
                }
                products.Add(headings);
                while (reader.Read())
                {
                    List<string> row = new List<string>(fieldCnt);
                    row.Add(reader["ProductName"].ToString());
                    row.Add(reader["QuantityPerUnit"].ToString());
                    row.Add(reader["UnitsInStock"].ToString());

                    products.Add(row);
                }
            }
        }
       return products;
    }

}