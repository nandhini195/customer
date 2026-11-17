<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Purchase Details</title>


<link rel="stylesheet" href="CustomerPurchase.css">

<script src="CustomerPurchase.js"></script>

</head>

<body>

 <!-- main container , <div> - html (create groups) ,
 .container - css (decides how box look)  -->
 
 
<!--  GROUP ONE  -->
<form id="purchaseForm" onsubmit="return validationForm()"
action="SaveCustomer.jsp" method="post">

 <div class ="container">
 

 <!-- Heading - html tag <h1></h1> -->
 
 <h1>Customer Purchase Details</h1>
 
<!--  Customer Details section 

Customer Name
Customer ID
Phone Number
Purchase Date
Full Address
City
PIN Code
Gender

 <label>Quantity : </label>
 <input id = "quantity">
 1.id
 2.type
 3.name
 4.placeholder
 5.maxlength
 6.radio
 7.value
 <br>
 
 -->

 <h2>1. Customer Details</h2>
 
<!--  Customer Name -->
 <label>Customer Name</label>
 <input type ="text" id ="customerName" name = "customerName" 
 maxlength = "50"
 placeholder = "Enter Customer Name" required>
 
 <!--  Customer ID -->
 <label>Customer ID</label>
 <input type ="text" id ="customerID" name = "customerID" 
 maxlength ="10" placeholder = "Enter Customer ID" required>
 
 <!--  Phone Number use type tel ,maxlenght-->
 <label>Phone Number</label>
 <input type ="tel" id ="phoneNo" name = "phoneNo" maxlength ="10"
 placeholder = "Enter Phone Number" required>
 
 <!-- Purchase Date use date -->
 <label>Purchase Date</label>
 <input type ="date" id = "purchaseDate" name = "purchaseDate" 
 placeholder = "Enter Purchase Date " required>
 
 <!-- Full Address use <textarea> </textarea> -->
 <label>Full Address</label>
 <textarea  id = "fullAddress" name = "fullAddress" 
 placeholder = "Enter Full Address "></textarea>
 
 <!--  City -->
 <label>City Name</label>
 <input type ="text" id ="cityName" name = "cityName"  
 maxlength = "40" placeholder = "Enter City Name">
 
 <!--  Pincode use maxlength  -->
 <label>PIN Code</label>
 <input type = "text" id = "pinCode" name = "pinCode" maxlength="6"
 placeholder = "Enter PIN Code">
 
 
 <!--  Gender use radio,value 
 radio buttons - same name.
 user select -  only one gender
  -->
  <!--  id = gendertype"
   placeholder = "Enter Gender type">
   -->
  
 <label>Gender</label>
 <input type ="radio" 
 name = "gender" 
 value ="Male">Male

 <input type ="radio" 
 name = "gender" 
 value ="Female">Female
 
 <input type ="radio" 
 name = "gender" 
 value ="Other">Other
 
<!--  for Check box Some Addtional info -->

 <label>Extra Details</label>

<input type ="Checkbox"  id="ExistingCustomer" name = "extraDetails" 
value = "ExistingCustomer">Existing Customer 

<input type ="Checkbox"  id="GiftWrapping" name = "extraDetails" 
value = "GiftWrapping"> Gift Wrapping Required 

<input type ="Checkbox" id="warranty"  name = "extraDetails" 
value = "Warranty">Warranty Required 

<input type ="Checkbox" id="HomeDelivery" name = "extraDetails" 
value = "HomeDelivery">Home Delivery Required 

<input type ="Checkbox" id="EmailInvoice"  name = "extraDetails" 
value = "EmailInvoice">Send Invoice by Email 

 </div>
 
 <!--  GROUP TWO  -->
 
 <div class ="container">
 
 <h2>2. Product Details</h2>
 
<!-- 
 Product Name - input- type,id,name,value               
 Category - Dropdown - select - id, name  , option tag - value 
 Quantity                     
 Unit Price 
 GST Rate - Dropdown - select - dropdown
 option - dropdown item
 Payment Method - Dropdown  -->                    


<!-- Product Name  -->
<label>Product Name</label>
<input type = "text" id = "productName"  name = "productName"
maxlength ="50">

<!--  Category -dropdown -->
<label>Category</label>
<select id = "category" name = "category">
<option value = "Electronics">Electronics</option>
<option value = "Furniture">Furniture</option>
<option value="Accessories">Accessories</option>
<option value = "Clothing">Clothing</option>
<option value = "Grocery">Grocery</option>
<option value="Other">Other</option>
</select>

<!--  Quantity   -->
<label>Quantity</label>
<input type = "number" id = "quantity"  name = "quantity"
value = "1" min = "1" max = "10000" step ="1"
oninput="calculateBill()">


<!-- min="1" → minimum quantity is 1
max="1000" → maximum quantity is 10000
step="1" → whole numbers only
value="1" → initial quantity is 1
oninput → recalculates the bill whenever the value changes 
for changing values used in dropdown botton -->

<!--  Unit Price  -->
<label>Unit Price</label>
<input type = "number" id = "unitPrice"  name = "unitPrice"
min = "0.01" max = "10000000" step = "0.01" 
value = "10000" oninput="calculateBill()" 
placeholder = "Enter Unit Price">


<!--  GST - dropdown -->
<label>GST Rate</label>
<select id = "gstRate"  name = "gstRate"
 onchange="calculateBill()">
<!-- name = "gstRate" -->
<option value = "">Select GST </option> 
<option value = "0">0%</option>
<option value = "5">5%</option>
<option value = "12">12%</option>
<option value = "18">18%</option>
<option value = "28">28%</option>
</select>


<!--  Payment Method - dropdown -->
<label>Payment Method</label>
<select id = "paymentMethod" name = "paymentMethod">
<option value = "">Select Payment Method</option> 
<option value = "UPI">UPI</option>
<option value = "Cash">Cash</option>
<option value = "Card">Card</option>
<option value = "EMI">EMI</option>
<option value = "Net Banking">Net Banking</option>
</select>

</div>
 
 <!--  GROUP Three  --> 
 
 <div class ="container">
 
 <h2>3. Bill Summary</h2>

<!-- create ids ,<p> tag  ,h2 tag
subtotal
gstAmount
totalAmount 
 
HTML creates the display.
id gives JavaScript a way to find it.
JavaScript later changes the value.
  -->

 <!--  <p class='gopal' id = "subtotal">SubTotal : </p> -->
 
 <!-- Hidden fields for database storage -->

<input type="hidden" id="subtotalValue" name="subtotal">

<input type="hidden" id="gstAmountValue" name="gst_amount">

<input type="hidden" id="totalAmountValue" name="total_amount">
 
  <p id = "subtotal">SubTotal : </p>
  <p id = "gstAmount">GST Amount : </p>
  <h2 id = "totalAmount"> Total Amount :  </h2>
  
 <!--  button - submit ,reset  -->
 
  <!-- <button class='gopal' type="submit">SUBMIT</button> -->
   <br> <br>
  <button type="submit">SUBMIT</button>
  <button type = "button" onclick ="resetForm()">RESET</button>  

 </div>
 
 <script>
window.onload = function() {

    const params = new URLSearchParams(window.location.search);

    if (params.get("clear") === "true") {

        document.querySelector("form").reset();

    }

};

</script>
</form>
</body>
</html>