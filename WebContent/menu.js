

var cart = new List([]);

if (document.readyState == 'loading') {
    document.addEventListener('DOMContentLoaded', ready)
} else {
    ready()
}

function ready() {

    var addToCartButtons = document.getElementsByClassName('shop-item-button')
    for (var i = 0; i < addToCartButtons.length; i++) {
        var button = addToCartButtons[i]
        button.addEventListener('click', addToCartClicked)
    }
}

function remove(event) {
    var shopItem = event.target.parentElement.parentElement;
    var title = shopItem.getElementsByClassName('shop-item-title')[0].innerText;
    shopItem.getElementsByClassName("shop-item-button")[0].innerText = "ADD";
    cart.delete(title);
    console.log(cart.toArray());
}

function add(event) {
    var shopItem = event.target.parentElement.parentElement;
    var title = shopItem.getElementsByClassName('shop-item-title')[0].innerText;
    shopItem.getElementsByClassName("shop-item-button")[0].innerText = "REMOVE";
    cart.push(title);
    console.log(cart.toArray());
}


function addToCartClicked(event) {
    var button = event.target;
    var shopItem = button.parentElement.parentElement;
    if (this.innerText == 'ADD') {
        shopItem.getElementsByClassName('shop-item-button')[0].onClick = add(event);
    } else {
        shopItem.getElementsByClassName('shop-item-button')[0].onClick = remove(event);
    }
}

function checkout(username) {
	window.location='add.jsp?username=' + username + '&cart='+cart.toArray();
}

$(document).ready(function() {
	if (sessionStorage.getItem("pincode") == null) {
	    $("#myModal").modal('show');
	    $("#myModal").modal({backdrop: "static"});
	}
});





function scrollFunc(id) {

    var elmnt = document.getElementById(id);

    elmnt.scrollIntoView();

}







function demo() {

    var pincode = document.querySelector("#pincode").value;

    $.ajax({

        type: "GET",

        url: "https://api.postalpincode.in/pincode/" + pincode,

        success: function(response)

        {
        	
        	if (response[0].Status == "Error") {
        		alert('Please enter a valid pincode.')
        	} else {
        		sessionStorage.setItem('pincode', pincode);
        		sessionStorage.setItem('city', response[0].PostOffice[0].Name);
        		sessionStorage.setItem('state', response[0].PostOffice[0].State);
        		alert(response[0].PostOffice[0].Name + ", " + response[0].PostOffice[0].State);
        	}

            $('#myModal').modal('hide');

        },

        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus);
            alert("Error: " + errorThrown);
        }

    })

    var pin_code = document.getElementById("pincode");



    var pat1 = /^\d{6}$/; // Regex





    if (!pat1.test(pin_code.value))

    {

        alert("Pin code should be 6 digits ");

        pin_code.focus();

        return false;

    }

}