/**
 * 
 */

/*<script type="text/javascript">
function addNumber(){
//debugger;
var num1 = parseFloat(
document.getElementById("num1").value
);
 var num2 = parseFloat(
document.getElementById("num2").value
);
 var result =  num1 + num2;
 document.getElementById("result").innerHTML = result;
}
</script>*/

/*get the values for id in html jsp page

var                  - create/store a variable
document             - access the webpage
getElementById()     - find an HTML element
.value               - get its entered value
parseFloat()         - convert text to a number

 */


function calculateBill() {  /*Calculate Subtotal, GST and Total Amount.*/
	var quantity = parseFloat(
	document.getElementById("quantity").value
);
     var unitPrice = parseFloat(
		document.getElementById("unitPrice").value
);
     var gstRate = parseFloat(
		document.getElementById("gstRate").value
);
/*calcutation*/
      
var subtotal = quantity*unitPrice;

var gstAmount = subtotal*gstRate/100;

var totalAmount = subtotal + gstAmount;


/*dispaly the result */

document.getElementById("subtotal").innerHTML = "SubTotal : "+
subtotal.toFixed(2);

document.getElementById("gstAmount").innerHTML = "GST Rate : "+
gstAmount.toFixed(2);

document.getElementById("totalAmount").innerHTML = "Total Amount : "+
totalAmount.toFixed(2);


document.getElementById("subtotalValue").value = subtotal;

document.getElementById("gstAmountValue").value = gstAmount;

document.getElementById("totalAmountValue").value = totalAmount;

 /*.toFixed(2); Keep 2 digits after the decimal point*/
}



/*submit botton */


function validationForm() {

    /* Check whether required fields are entered before submitting */
 debugger;
    /* customerName */
    var customerName = document.getElementById("customerName").value;

    if (customerName == "") {
        alert("Please Enter Customer Name");
        return false;
    }

    /* customerID */
    var customerID = document.getElementById("customerID").value;

    if (customerID == "") {
		alert("Please Enter  Customer ID");
	    return false;
	}
	
	if(!/^[A-Za-z0-9]+$/.test(customerID)){
        alert("Please Enter  Customer ID  with using Alp&Num");
        return false;
    }

    /* phoneNo */
    var phoneNo = document.getElementById("phoneNo").value;

    if (phoneNo == ""){
		alert("Please Enter Phone Number");
		return false;
		}
		
	if(!/^[0-9]{10}$/.test(phoneNo)){
        alert("Please Enter 10 digit Phone Number");
        return false;
    }
	
	/* pinCode */
	var pinCode = document.getElementById("pinCode").value;
	
	if (pinCode == ""){
	alert("Please Enter PIN CODE");
	return false;
	}

	
	if (!/^[0-9]{6}$/.test(pinCode)) {
	    alert("Enter a valid 6 digit PIN Code");
	    return false;
	}

    /* purchaseDate */
    var purchaseDate = document.getElementById("purchaseDate").value;

    if (purchaseDate == "") {
        alert("Please Select Purchase Date");
        return false;
    }
	
	/* Address*/
	var fullAddress = document.getElementById("fullAddress").value;

	if (fullAddress.trim() == "") {
	    alert("Please Enter Full Address");
	    return false;
	}

	/*City*/
	var cityName = document.getElementById("cityName").value;

	if (cityName.trim() == "") {
	    alert("Please Enter City Name");
	    return false;
	}

/*	 Gender*/
	var gender = document.querySelector('input[name="gender"]:checked');

	if (gender == null) {
	    alert("Please Select Gender");
	    return false;
	}

	/* Payment Method*/
	var paymentMethod = document.getElementById("paymentMethod").value;

	if (paymentMethod == "") {
	    alert("Please Select Payment Method");
	    return false;
	}

    /* productName */
    var productName = document.getElementById("productName").value;

    if (productName == "") {
        alert("Please Enter Product Name");
        return false;
    }

    /* quantity */
    var quantity = document.getElementById("quantity").value;

    if (quantity == "" || quantity <= 0) {
        alert("Please Enter Valid Quantity");
        return false;
    }

    /* unitPrice */
    var unitPrice = document.getElementById("unitPrice").value;

    if (unitPrice == "" || unitPrice <= 0) {
        alert("Please Enter Valid Unit Price");
        return false;
    }
	
	if (!/^\d{1,8}(\.\d{1,2})?$/.test(unitPrice)) {
	    alert("Unit Price must contain maximum 8 digits and 2 decimal places");
	    return false;
	}
	/*if(!/^\d{1,8}(\.\d{1,2})?$/.test(unitPrice)){
        alert("Unit Price must contain maximum 8 digits and 2 decimal places");
        return false;
	}*/
	/*Symbol	             Meaning
	^	                   Start of the value
	\d	                   Any digit from 0 to 9
	{1,8}	               Minimum 1 and maximum 8 digits
	()	                   Groups a pattern
	\.	                   A decimal point
	\d{1,2}	               1 or 2 digits after decimal
	?	                   Decimal portion is optional
	$	                   End of the value
	*/
	
	
	
	
	if(Number(unitPrice)>10000000){
		alert("Unit Price cannot exceed 10000000");
		return false;
	}
	
	var gstRate = document.getElementById("gstRate").value;

	if (gstRate == "") {
	    alert("Please Select GST Rate");
	    return false;
	}
	
    var ExistingCustomer = document.getElementById("ExistingCustomer").checked;
	
	var GiftWrapping = document.getElementById("GiftWrapping").checked;
	
	var warranty = document.getElementById("warranty").checked;
	
	var HomeDelivery = document.getElementById("HomeDelivery").checked;
	

	var EmailInvoice = document.getElementById("EmailInvoice").checked;
    alert("Form Submitted Successfully!");

	calculateBill();

	alert("Form Submitted Successfully!");

	return true;
}



/*for reset button*/

function resetForm() {
    document.getElementById("purchaseForm").reset();
}




