
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.cuspurdb.DBConnection" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Customer Purchase Report</title>

<!-- ================= JQUERY ================= -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- ================= DATATABLES CSS ================= -->
<link rel="stylesheet"
href="https://cdn.datatables.net/1.13.8/css/jquery.dataTables.min.css">

<link rel="stylesheet"
href="https://cdn.datatables.net/buttons/2.4.2/css/buttons.dataTables.min.css">


<!-- ================= DATATABLES JS ================= -->
<script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>

<!-- EXCEL EXPORT SUPPORT -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>

<!-- DATATABLES BUTTONS -->
<script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>

<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.html5.min.js"></script>


<style>


 /*   //PAGE DESIGN */


* {
    box-sizing: border-box;
}

body {
    margin: 0;
    padding: 25px 20px;
    font-family: Arial, sans-serif;
    background: #EAF2FC;
    color: #172B4D;
}

h2 {
    text-align: center;
    color: #082B5C;
    font-size: 24px;
    font-weight: bold;
    margin: 5px 0 22px;
}


/* TOP BUTTONS */

.top-buttons {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 12px;
    flex-wrap: wrap;
    margin-bottom: 25px;
}

.top-buttons button {
    min-width: 95px;
    height: 38px;
    padding: 0 16px;
    background: #082B5C;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 13px;
    font-weight: bold;
    cursor: pointer;
}

.top-buttons button:hover {
    background: #1769AA;
}

.top-buttons #exitBtn {
    background: #C62828;
}

.top-buttons #exitBtn:hover {
    background: #A31515;
}


/* DATATABLES GENERAL */

.dataTables_wrapper {
    width: 100%;
    font-size: 13px;
}

.dataTables_scroll {
    width: 100%;
}

.dataTables_scrollHead,
.dataTables_scrollBody {
    width: 100% !important;
}


/* EXPORT BUTTONS */

.dataTables_wrapper .dt-buttons {
    margin-bottom: 12px;
}

.dataTables_wrapper .dt-buttons button {
    background: #082B5C !important;
    color: white !important;
    border: 1px solid #082B5C !important;
    border-radius: 5px !important;
    padding: 9px 16px !important;
    margin-right: 7px !important;
    font-weight: bold !important;
    cursor: pointer;
}

.dataTables_wrapper .dt-buttons button:hover {
    background: #1769AA !important;
}


/* GLOBAL SEARCH */

.dataTables_wrapper .dataTables_filter {
    margin-bottom: 12px;
}

.dataTables_wrapper .dataTables_filter input {
    height: 34px;
    padding: 6px 9px;
    border: 1px solid #9AB3D0;
    border-radius: 5px;
    background: white;
}


/* PAGE LENGTH */

.dataTables_wrapper .dataTables_length select {
    height: 34px;
    padding: 4px 8px;
    border: 1px solid #9AB3D0;
    border-radius: 5px;
    background: white;
}


/* TABLE WIDTH */

#purchaseTable,
.dataTables_scrollHead table,
.dataTables_scrollBody table {
    width: 100% !important;
    min-width: 2200px !important;
    border-collapse: collapse !important;
}


/* MAIN HEADER - DARK BLUE */

#purchaseTable thead tr:first-child th,
.dataTables_scrollHead thead tr:first-child th {
    background: #082B5C !important;          /* MAIN HEADER - DARK BLUE */
    background-color: #082B5C !important;
    color: #FFFFFF !important;
    font-weight: bold !important;
    text-align: center !important;
    height: 45px;
    padding: 12px 9px !important;
    border: 1px solid #244A78 !important;
    white-space: nowrap;
}


/* INDIVIDUAL SEARCH HEADER */

#purchaseTable thead tr.filters th,
.dataTables_scrollHead thead tr.filters th {
    background: #D8E9FA !important;
    background-color: #D8E9FA !important;
    color: #082B5C !important;
    padding: 9px 7px !important;
    min-width: 125px;
    text-align: center !important;
    vertical-align: top;
    border: 1px solid #B5CBE3 !important;
}


/*SEARCH INPUTS */

.searchField {
    display: block;
    width: 100% !important;
    height: 35px;
    padding: 6px 7px;
    margin: 0 0 7px 0;
    background: #FFFFFF !important;
    color: #172B4D !important;
    border: 1px solid #7899BE !important;
    border-radius: 4px;
    font-size: 12px;
    outline: none;
}

.searchField:focus {
    border: 2px solid #1769AA !important;
}


/* INDIVIDUAL SEARCH BUTTONS 

.columnSearchBtn {
    display: block;
    width: 100% !important;
    height: 32px;
    padding: 5px 8px;
    background: #082B5C !important;
    color: #FFFFFF !important;
    border: none !important;
    border-radius: 4px;
    font-size: 12px;
    font-weight: bold;
    cursor: pointer;
}

.columnSearchBtn:hover {
    background: #1769AA !important;
}
*/

/* TABLE BODY */

#purchaseTable tbody td,
.dataTables_scrollBody table tbody td {
    background: #FFFFFF;
    color: #172B4D;
    border-bottom: 1px solid #D4DFEC !important;
    text-align: center;
    height: 40px;
    padding: 10px 9px !important;
    white-space: nowrap;
}

#purchaseTable tbody tr:nth-child(even) td,
.dataTables_scrollBody table tbody tr:nth-child(even) td {
    background: #F0F6FD;
}

#purchaseTable tbody tr:hover td,
.dataTables_scrollBody table tbody tr:hover td {
    background: #D5E8FC !important;
}


/* GRAND TOTAL FOOTEr */

#purchaseTable tfoot th,
.dataTables_scrollBody table tfoot th {
    background: #082B5C !important;
    color: #FFFFFF !important;
    font-weight: bold;
    height: 42px;
    padding: 10px !important;
    text-align: right !important;
    border: 1px solid #244A78 !important;
    white-space: nowrap;
}


/* 
   PAGINATION
 */

.dataTables_wrapper .dataTables_info {
    color: #082B5C;
    padding-top: 14px;
    font-size: 13px;
}

.dataTables_wrapper .dataTables_paginate {
    padding-top: 10px;
}

.dataTables_wrapper .dataTables_paginate .paginate_button.current {
    background: #082B5C !important;
    color: white !important;
    border: 1px solid #082B5C !important;
}

.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
    background: #1769AA !important;
    color: white !important;
    border: 1px solid #1769AA !important;
}


/* ERROR */
.error {
    color: #C62828;
    text-align: center;
    font-weight: bold;
    margin: 15px;
}


.date-filter {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    flex-wrap: wrap;
    margin: 20px 0;
    padding: 15px;
    background: #D8E9FA;
    border-radius: 6px;
}

.date-filter label {
    color: #082B5C;
    font-weight: bold;
}

.date-filter input {
    padding: 8px;
    border: 1px solid #7899BE;
    border-radius: 4px;
}

#clearDate {
    background: #082B5C;
    color: white;
    border: none;
    padding: 9px 15px;
    border-radius: 4px;
    cursor: pointer;
}


</style>

</head>

<body>


<!-- 
     PAGE TITLE
-->

<h2>CUSTOMER PURCHASE REPORT</h2>


<!--  TOP BUTTONS-->

<div class="top-buttons">

    <button type="button" id="clearBtn">Clear</button>

    <button type="button" id="backBtn">Go Back</button>

    <button type="button" id="formBtn">Return to Form</button>

    <button type="button" id="exitBtn">Exit</button>

</div>


<!-- 
     DATABASE CONNECTION
 -->

<%

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

String errorMessage = "";
int count = 0;

try {

    con = DBConnection.getConnection();

    if (con == null) {
        throw new SQLException("Database connection failed.");
    }

    String sql = "SELECT * FROM customer_purchase";

    ps = con.prepareStatement(sql);

    rs = ps.executeQuery();

%>


<!-- CUSTOMER PURCHASE TABLE-->

<table id="purchaseTable" class="display nowrap">


<!-- Purchase Date Filter  -->

<div class = "date-filter">

<label>From Date:</label>
<input type ="date" id ="minDate">

<label>To Date:</label>
<input type ="date" id = "maxDate">

<button type ="button" id ="clearDate">Clear Dates</button>
</div>


<thead>

<!-- MAIN COLUMN HEADINGS -->

<tr>

    <th>S.No</th>
    <th>Customer Name</th>
    <th>Customer ID</th>
    <th>Phone</th>
    <th>Purchase Date</th>
    <th>Address</th>
    <th>City</th>
    <th>Pin Code</th>
    <th>Gender</th>
    <th>Extra Details</th>
    <th>Product Name</th>
    <th>Category</th>
    <th>Quantity</th>
    <th>Unit Price</th>
    <th>GST Rate</th>
    <th>Payment Method</th>
    <th>Subtotal</th>
    <th>GST Amount</th>
    <th>Total Amount</th>

</tr>


<!-- INDIVIDUAL SEARCH INPUTS -->

<tr class="filters">

    <th></th>

    <th>
        <input class="searchField" data-column="1" placeholder="Name">
       <!--  <button type="button" class="columnSearchBtn" data-column="1"></button> -->
    </th>

    <th>
        <input class="searchField" data-column="2" placeholder="Customer ID">
     <!--    <button type="button" class="columnSearchBtn" data-column="2"></button> -->
    </th>

    <th>
        <input class="searchField" data-column="3" placeholder="Phone">
     <!--    <button type="button" class="columnSearchBtn" data-column="3"></button> -->
    </th>

    <th>
        <input class="searchField" data-column="4" placeholder="Date">
    <!--     <button type="button" class="columnSearchBtn" data-column="4"></button> -->
    </th>

    <th>
        <input class="searchField" data-column="5" placeholder="Address">
   <!--      <button type="button" class="columnSearchBtn" data-column="5"></button> -->
    </th>

    <th>
        <input class="searchField" data-column="6" placeholder="City">
       <!--  <button type="button" class="columnSearchBtn" data-column="6"></button> -->
    </th>

    <th>
        <input class="searchField" data-column="7" placeholder="Pin Code">
       <!--  <button type="button" class="columnSearchBtn" data-column="7"></button> -->
    </th>

    <th>
        <input class="searchField" data-column="8" placeholder="Gender">
  <!--       <button type="button" class="columnSearchBtn" data-column="8"></button> -->
    </th>

    <th>
        <input class="searchField" data-column="9" placeholder="Details">
     <!--    <button type="button" class="columnSearchBtn" data-column="9"></button> -->
    </th>

    <th>
        <input class="searchField" data-column="10" placeholder="Product">
<!--         <button type="button" class="columnSearchBtn" data-column="10"></button> -->
    </th>

    <th>
        <input class="searchField" data-column="11" placeholder="Category">
  
    </th>

    <th>
        <input class="searchField" data-column="12" placeholder="Example: >5">
    
    </th>

    <th>
        <input class="searchField" data-column="13" placeholder="Example: <1000">
    
    </th>

    <th>
        <input class="searchField" data-column="14" placeholder="Example: =18">
        
    </th>

    <th>
        <input class="searchField" data-column="15" placeholder="Payment">
        
    </th>

    <th>
        <input class="searchField" data-column="16" placeholder="Example: >=1000">
       
    </th>

    <th>
        <input class="searchField" data-column="17" placeholder="Example: >100">
       
    </th>

    <th>
        <input class="searchField" data-column="18" placeholder="Example: >1000">
    
    </th>

</tr>

</thead>


<!-- TABLE RECORDS-->

<tbody>

<%

while (rs.next()) {

    count++;

%>

<tr>

    <td><%= count %></td>

    <td><%= rs.getString("customer_name") %></td>

    <td><%= rs.getString("customer_id") %></td>

    <td><%= rs.getString("phone") %></td>

    <td><%= rs.getString("purchasedate") %></td>

    <td><%= rs.getString("address") %></td>

    <td><%= rs.getString("city") %></td>

    <td><%= rs.getString("pin_code") %></td>

    <td><%= rs.getString("gender") %></td>

    <td><%= rs.getString("extra_details") %></td>

    <td><%= rs.getString("product_name") %></td>

    <td><%= rs.getString("category") %></td>

    <td><%= rs.getString("quantity") %></td>

    <td><%= rs.getString("unit_price") %></td>

    <td><%= rs.getString("gst_rate") %></td>

    <td><%= rs.getString("payment_method") %></td>

    <td><%= rs.getString("subtotal") %></td>

    <td><%= rs.getString("gst_amount") %></td>

    <td><%= rs.getString("total_amount") %></td>

</tr>

<%

}

} catch (Exception e) {

    errorMessage = e.getMessage();

    application.log("CustomerReport.jsp error", e);

} finally {

    try {
        if (rs != null) rs.close();
    } catch (Exception e) {}

    try {
        if (ps != null) ps.close();
    } catch (Exception e) {}

    try {
        if (con != null) con.close();
    } catch (Exception e) {}

}

%>

</tbody>


<!-- 
     GRAND TOTAL
 -->

<tfoot>

<tr>

    <th colspan="16">GRAND TOTAL</th>

    <th></th>

    <th></th>

    <th></th>

</tr>

</tfoot>

</table>


<% if (!errorMessage.isEmpty()) { %>

<p class="error">
    Database Error: <%= errorMessage %>
</p>

<% } %>

<!--
     COMPLETE JQUERY + DATATABLES SCRIPT
 -->

<script>

$(document).ready(function() {
   
   /* NUMERIC COLUMN INDEXES */
  
    var numericColumns = [12, 13, 14, 16, 17, 18];

    // Store arithmetic search values
    var numericFilters = {};

    // ARITHMETIC SEARCH FUNCTION
   
    function numericSearch(value, cellValue) {

        value = value.trim();

        var number = parseFloat(
            String(cellValue).replace(/[^0-9.-]/g, '')
        );

        if (value === "") {
            return true;
        }

        if (isNaN(number)) {
            return false;
        }

        var target;


        // GREATER THAN OR EQUAL
        if (value.startsWith(">=")) {

            target = parseFloat(value.substring(2));

            return !isNaN(target) && number >= target;

        }


        // LESS THAN OR EQUAL
        if (value.startsWith("<=")) {

            target = parseFloat(value.substring(2));

            return !isNaN(target) && number <= target;

        }


        // NOT EQUAL
        if (value.startsWith("!=")) {

            target = parseFloat(value.substring(2));

            return !isNaN(target) && number !== target;

        }


        // GREATER THAN
        if (value.startsWith(">")) {

            target = parseFloat(value.substring(1));

            return !isNaN(target) && number > target;

        }


        // LESS THAN
        if (value.startsWith("<")) {

            target = parseFloat(value.substring(1));

            return !isNaN(target) && number < target;

        }


        // EQUAL
        if (value.startsWith("=")) {

            target = parseFloat(value.substring(1));

            return !isNaN(target) && number === target;

        }


        // EXACT MATCH
        target = parseFloat(value);

        return !isNaN(target) && number === target;

    }

    // CUSTOM DATATABLE FILTER
    // REGISTER ONLY ONCE

    $.fn.dataTable.ext.search.push(function(settings, data) {

        if (settings.nTable.id !== "purchaseTable") {
            return true;
        }

        for (var col in numericFilters) {

            if (!numericSearch(numericFilters[col], data[col])) {

                return false;

            }

        }

        return true;

    });

    // INITIALIZE DATATABLE

    var table = $('#purchaseTable').DataTable({

        // Layout
        dom: 'Blfrtip',

        // EXPORT BUTTONS
        buttons: [

            {
                extend: 'copyHtml5',
                text: 'Copy Report'
            },

            {
                extend: 'excelHtml5',
                text: 'Export Excel',
                title: 'Customer Purchase Report'
            },

            {
                extend: 'csvHtml5',
                text: 'Export CSV',
                title: 'Customer Purchase Report'
            }

        ],


        // PAGINATION
        pageLength: 10,

        lengthMenu: [10, 25, 50, 100, 250, 500],

        // DATATABLE FEATURES
        searching: true,

        ordering: true,

        paging: true,

        info: true,

        lengthChange: true,

        // HORIZONTAL SCROLL
        scrollX: true,

        scrollCollapse: false,

        autoWidth: false,

        orderCellsTop: true,

        // SORT BY PURCHASE DATE
        order: [[4, 'desc']],

        // FOOTER GRAND TOTAL

        footerCallback: function() {

            var api = this.api();


            function getNumber(value) {

                return parseFloat(
                    String(value).replace(/[^0-9.-]/g, '')
                ) || 0;

            }


            // SUBTOTAL
            var subtotal = api.column(16, {
                search: 'applied'
            }).data().reduce(function(a, b) {

                return getNumber(a) + getNumber(b);

            }, 0);


            // GST AMOUNT
            var gst = api.column(17, {
                search: 'applied'
            }).data().reduce(function(a, b) {

                return getNumber(a) + getNumber(b);

            }, 0);


            // TOTAL AMOUNT
            var total = api.column(18, {
                search: 'applied'
            }).data().reduce(function(a, b) {

                return getNumber(a) + getNumber(b);

            }, 0);


            // DISPLAY TOTALS
            $(api.column(16).footer()).html(subtotal.toFixed(2));

            $(api.column(17).footer()).html(gst.toFixed(2));

            $(api.column(18).footer()).html(total.toFixed(2));

        }

    });
  
    // INDIVIDUAL COLUMN SEARCH BUTTON
 
  $(document).on('keyup change', '.searchField', function() {

	    var colIndex = parseInt($(this).attr('data-column'));

	    var value = $(this).val().trim();


        if (numericColumns.includes(colIndex)) {

            // ARITHMETIC SEARCH
            numericFilters[colIndex] = value;

            // Remove normal column search
            table.column(colIndex).search('');

            // Apply arithmetic filter
            table.draw();

        } else {

            // NORMAL TEXT SEARCH
            delete numericFilters[colIndex];

            table.column(colIndex).search(value).draw();

        }

    });

    // ENTER KEY SEARCH

    $(document).on('keydown', '.searchField', function(e) {

        if (e.key === "Enter") {

            e.preventDefault();

            var colIndex = parseInt(
                $(this).attr('data-column')
            );

            $('.columnSearchBtn[data-column="' + colIndex + '"]').click();

        }

    });

    // PREVENT HEADER SORTING
    $(document).on('click', '.searchField', function(e) {

        e.stopPropagation();

    });



  
    // CLEAR BUTTON


    $('#clearBtn').click(function() {

        // Clear global search
        table.search('');

        // Clear normal column searches
        table.columns().search('');

        // Clear arithmetic filters
        numericFilters = {};

        // Clear individual inputs
        $('.searchField').val('');

        // Show all records from first page
        table.draw();

        table.page('first').draw('page');

    });



    // GO BACK BUTTON


    $('#backBtn').click(function() {

        window.history.back();

    });



    // RETURN TO FORM
 

    $('#formBtn').click(function() {

        window.location.href = 'CustomerPurchase.jsp';

    });



    // EXIT BUTTON
 

    $('#exitBtn').click(function() {

        var answer = confirm("Are you sure you want to exit?");

        if (answer) {

            window.close();

        }

    });


});

</script>


</body>
</html>
