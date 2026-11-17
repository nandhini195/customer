<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.cuspurdb.DBConnection" %>

<%
request.setCharacterEncoding("UTF-8");

// Get values from the purchase form

String customerName = request.getParameter("customerName");
String customerID = request.getParameter("customerID");
String phoneNo = request.getParameter("phoneNo");
String purchaseDate = request.getParameter("purchaseDate");
String fullAddress = request.getParameter("fullAddress");
String cityName = request.getParameter("cityName");
String pinCode = request.getParameter("pinCode");
String gender = request.getParameter("gender");

// Get selected extra details

String[] extraDetails = request.getParameterValues("extraDetails");

String additionalDetails = "";

if (extraDetails != null) {
    additionalDetails = String.join(", ", extraDetails);
}

// Get product details

String productName = request.getParameter("productName");
String category = request.getParameter("category");
String quantity = request.getParameter("quantity");
String unitPrice = request.getParameter("unitPrice");
String gstRate = request.getParameter("gstRate");
String paymentMethod = request.getParameter("paymentMethod");
String subtotal = request.getParameter("subtotal");
String gstAmount = request.getParameter("gst_amount");
String totalAmount = request.getParameter("total_amount");

boolean saved = false;
String errorMessage = "";

Connection con = null;
PreparedStatement ps = null;

try {

    // Connect to database
    con = DBConnection.getConnection();

    if (con == null) {
        throw new SQLException("Unable to connect to MySQL database!");
    }

    // SQL INSERT query

    String sql = "INSERT INTO customer_purchase "
        + "(customer_name, customer_id, phone, purchasedate, "
        + "address, city, pin_code, gender, extra_details, "
        + "product_name, category, quantity, unit_price, "
        + "gst_rate, payment_method, subtotal, gst_amount, total_amount) "
        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    ps = con.prepareStatement(sql);

    // Set values for 18 parameters

    ps.setString(1, customerName);
    ps.setString(2, customerID);
    ps.setString(3, phoneNo);
    ps.setDate(4, java.sql.Date.valueOf(purchaseDate));
    ps.setString(5, fullAddress);       // FIXED: Missing parameter 5
    ps.setString(6, cityName);
    ps.setString(7, pinCode);
    ps.setString(8, gender);
    ps.setString(9, additionalDetails);
    ps.setString(10, productName);
    ps.setString(11, category);
    ps.setInt(12, Integer.parseInt(quantity));
    ps.setBigDecimal(13, new java.math.BigDecimal(unitPrice));
    ps.setBigDecimal(14, new java.math.BigDecimal(gstRate));
    ps.setString(15, paymentMethod);
    ps.setBigDecimal(16, new java.math.BigDecimal(subtotal));
    ps.setBigDecimal(17, new java.math.BigDecimal(gstAmount));
    ps.setBigDecimal(18, new java.math.BigDecimal(totalAmount));

    // Execute INSERT query

    int result = ps.executeUpdate();

    if (result > 0) {
        saved = true;
    }

} catch (Exception e) {

    errorMessage = e.getMessage();

    application.log("Purchase saving error", e);

} finally {

    try {
        if (ps != null) {
            ps.close();
        }

        if (con != null) {
            con.close();
        }
    } catch (SQLException e) {
        application.log("Database closing error", e);
    }

}

%>

<!DOCTYPE html>
<html>
<head>

<title>Purchase Status</title>

<style>

body {
    font-family: Arial;
    background-color: #EAF3FF;
    text-align: center;
    padding-top: 100px;
}

.container {
    background-color: white;
    width: 450px;
    margin: auto;
    padding: 35px;
    border-radius: 10px;
    box-shadow: 0 0 10px #B7CDE5;
}

h2 {
    color: #082B5C;
}

.success {
    color: green;
    font-size: 18px;
}

.error {
    color: red;
}

button {
    background-color: #082B5C;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin: 8px;
}

button:hover {
    background-color: #2563A6;
}

</style>

</head>

<body>

<div class="container">

<% if (saved) { %>

    <h2>Purchase Saved Successfully!</h2>

    <p class="success">
        Your purchase details have been added to the database.
    </p>

    <!-- View Report Button -->

    <form action="CustomerReport.jsp" method="get">
        <button type="submit">View Report</button>
    </form>

    <!-- Go Back Button -->

    <button onclick="window.location.href='CustomerPurchase.jsp">Go Back</button>

    <!-- Clear Button -->

    <button onclick="window.location.href ='CustomerPurchase.jsp?clear=true'">
        Clear
    </button>

<% } else { %>

    <h2>Unable to Save Purchase</h2>

    <p class="error">
        Error: <%= errorMessage %>
    </p>

    <button onclick="history.back()">Go Back</button>

<% } %>

</div>

</body>
</html>
