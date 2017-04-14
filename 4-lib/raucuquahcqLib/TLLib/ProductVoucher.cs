using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace TLLib
{
    public class ProductVoucher
    {
        string connectionString = Common.ConnectionString;
        DBNull dbNULL = DBNull.Value;

        public int ProductVoucherInsert(
            string VoucherCode,
            string VoucherPrice,
            string FullName,
            string Address,
            string HomePhone,
            string CellPhone,
            string Email,
            string IsReceived,
            string IsUse
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductVoucher_Insert", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@VoucherCode", string.IsNullOrEmpty(VoucherCode) ? dbNULL : (object)VoucherCode);
                cmd.Parameters.AddWithValue("@VoucherPrice", string.IsNullOrEmpty(VoucherPrice) ? dbNULL : (object)VoucherPrice);
                cmd.Parameters.AddWithValue("@FullName", string.IsNullOrEmpty(FullName) ? dbNULL : (object)FullName);
                cmd.Parameters.AddWithValue("@Address", string.IsNullOrEmpty(Address) ? dbNULL : (object)Address);
                cmd.Parameters.AddWithValue("@HomePhone", string.IsNullOrEmpty(HomePhone) ? dbNULL : (object)HomePhone);
                cmd.Parameters.AddWithValue("@CellPhone", string.IsNullOrEmpty(CellPhone) ? dbNULL : (object)CellPhone);
                cmd.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(Email) ? dbNULL : (object)Email);
                cmd.Parameters.AddWithValue("@IsReceived", string.IsNullOrEmpty(IsReceived) ? dbNULL : (object)IsReceived);
                cmd.Parameters.AddWithValue("@IsUse", string.IsNullOrEmpty(IsUse) ? dbNULL : (object)IsUse);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductVoucher_Insert' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ProductVoucherUpdate(
            string ProductVoucherID,
            string VoucherCode,
            string VoucherPrice,
            string FullName,
            string Address,
            string HomePhone,
            string CellPhone,
            string Email,
            string IsReceived,
            string IsUse
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductVoucher_Update", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductVoucherID", string.IsNullOrEmpty(ProductVoucherID) ? dbNULL : (object)ProductVoucherID);
                cmd.Parameters.AddWithValue("@VoucherCode", string.IsNullOrEmpty(VoucherCode) ? dbNULL : (object)VoucherCode);
                cmd.Parameters.AddWithValue("@VoucherPrice", string.IsNullOrEmpty(VoucherPrice) ? dbNULL : (object)VoucherPrice);
                cmd.Parameters.AddWithValue("@FullName", string.IsNullOrEmpty(FullName) ? dbNULL : (object)FullName);
                cmd.Parameters.AddWithValue("@Address", string.IsNullOrEmpty(Address) ? dbNULL : (object)Address);
                cmd.Parameters.AddWithValue("@HomePhone", string.IsNullOrEmpty(HomePhone) ? dbNULL : (object)HomePhone);
                cmd.Parameters.AddWithValue("@CellPhone", string.IsNullOrEmpty(CellPhone) ? dbNULL : (object)CellPhone);
                cmd.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(Email) ? dbNULL : (object)Email);
                cmd.Parameters.AddWithValue("@IsReceived", string.IsNullOrEmpty(IsReceived) ? dbNULL : (object)IsReceived);
                cmd.Parameters.AddWithValue("@IsUse", string.IsNullOrEmpty(IsUse) ? dbNULL : (object)IsUse);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductVoucher_Update' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Number.ToString());
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ProductVoucherDelete(
            string ProductVoucherID
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductVoucher_Delete", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductVoucherID", string.IsNullOrEmpty(ProductVoucherID) ? dbNULL : (object)ProductVoucherID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductVoucher_Delete' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Number.ToString());
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable ProductVoucherSelectAll(
            string Keyword,
            string VoucherCode,
            string FromDate,
            string ToDate,
            string FullName,
            string Address,
            string HomePhone,
            string CellPhone,
            string Email,
            string IsReceived,
            string IsUse
        )
        {
            try
            {
                var dt = new DataTable();
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductVoucher_SelectAll", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Keyword", string.IsNullOrEmpty(Keyword) ? dbNULL : (object)Keyword);
                cmd.Parameters.AddWithValue("@VoucherCode", string.IsNullOrEmpty(VoucherCode) ? dbNULL : (object)VoucherCode);
                cmd.Parameters.AddWithValue("@FromDate", string.IsNullOrEmpty(FromDate) ? dbNULL : (object)FromDate);
                cmd.Parameters.AddWithValue("@ToDate", string.IsNullOrEmpty(ToDate) ? dbNULL : (object)ToDate);
                cmd.Parameters.AddWithValue("@FullName", string.IsNullOrEmpty(FullName) ? dbNULL : (object)FullName);
                cmd.Parameters.AddWithValue("@Address", string.IsNullOrEmpty(Address) ? dbNULL : (object)Address);
                cmd.Parameters.AddWithValue("@HomePhone", string.IsNullOrEmpty(HomePhone) ? dbNULL : (object)HomePhone);
                cmd.Parameters.AddWithValue("@CellPhone", string.IsNullOrEmpty(CellPhone) ? dbNULL : (object)CellPhone);
                cmd.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(Email) ? dbNULL : (object)Email);
                cmd.Parameters.AddWithValue("@IsReceived", string.IsNullOrEmpty(IsReceived) ? dbNULL : (object)IsReceived);
                cmd.Parameters.AddWithValue("@IsUse", string.IsNullOrEmpty(IsUse) ? dbNULL : (object)IsUse);
                var errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                var sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductVoucher_SelectAll' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return dt;
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Number.ToString());
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable ProductVoucherSelectOne(
            string ProductVoucherID
        )
        {
            try
            {
                var dt = new DataTable();
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductVoucher_SelectOne", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductVoucherID", string.IsNullOrEmpty(ProductVoucherID) ? dbNULL : (object)ProductVoucherID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                var sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductVoucher_SelectOne' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return dt;
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Number.ToString());
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable ProductVoucherSelectByVoucherCode(
            string VoucherCode
        )
        {
            try
            {
                var dt = new DataTable();
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductVoucher_SelectByVoucherCode", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@VoucherCode", string.IsNullOrEmpty(VoucherCode) ? dbNULL : (object)VoucherCode);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                var sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductVoucher_SelectByVoucherCode' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return dt;
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Number.ToString());
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable ProductVoucherSelectByEmail(
            string Email
        )
        {
            try
            {
                var dt = new DataTable();
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductVoucher_SelectByEmail", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(Email) ? dbNULL : (object)Email);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                var sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductVoucher_SelectByEmail' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return dt;
            }
            catch (SqlException ex)
            {
                throw new Exception(ex.Number.ToString());
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ProductVoucherQuickUpdate(
            string VoucherCode,
            string Email,
            string IsReceived,
            string IsUse
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProductVoucher_QuickUpdate", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@VoucherCode", string.IsNullOrEmpty(VoucherCode) ? dbNULL : (object)VoucherCode);
                cmd.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(Email) ? dbNULL : (object)Email);
                cmd.Parameters.AddWithValue("@IsReceived", string.IsNullOrEmpty(IsReceived) ? dbNULL : (object)IsReceived);
                cmd.Parameters.AddWithValue("@IsUse", string.IsNullOrEmpty(IsUse) ? dbNULL : (object)IsUse);

                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProductVoucher_QuickUpdate' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
