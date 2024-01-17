


const url = window.location.search;
const params = new URLSearchParams(url)
const productId = params.get("id");
var displayQuantity = 250;


var productPrice = document.getElementById('quantity_of_product').innerText;
let value = productPrice.split(":");
let finalPrice = parseFloat(value[1]);

document.addEventListener("DOMContentLoaded" ,function () {
    var quantity = 250;
    var maxQuantity = 5000;
    var incrementButton = document.getElementById('increment');
    var decrementButton = document.getElementById('decrement');
    var gramQuantityElement = document.getElementById('gram');

    console.log("hellooo");

    incrementButton.addEventListener('click', function () {
        if (quantity < maxQuantity) {
            quantity += 250;
            updateQuantity();
        }
    });

    decrementButton.addEventListener('click', function () {
        if (quantity > 250) {
            quantity -= 250;
            updateQuantity();
        }
    });

    function updateQuantity() {
        if (quantity >= 1000) {
            displayQuantity = (quantity / 1000).toFixed(2) + 'kg';
        } else {
            displayQuantity = quantity + 'g';
        }
        gramQuantityElement.textContent = displayQuantity;

    }
    
    
    var buyButton = document.getElementById('buybutton');
    var totalpriceElement = document.getElementById('totalprice_of_product');
    
    
    buyButton.addEventListener('click', function () {
        displayQuantity = parseFloat(displayQuantity);
        if (displayQuantity < 1000 && displayQuantity > 200) {
            displayQuantity = displayQuantity / 1000;
        }
        

        let priceUpdate = displayQuantity * finalPrice;
        console.log(priceUpdate + "price");
        console.log(typeof finalPrice + "price");
        console.log(typeof displayQuantity + "quantity");
        productPrice.innerHTML = priceUpdate;
        console.log(typeof quantity + "mental");
        console.log(typeof productPrice + "loosu");
        let quant_div = Math.floor(quantity / 250);
        var totalPrice = quant_div * priceUpdate;
        console.log(totalPrice + "totalprice");

        var redirectUrl = "/greenfarm-web/payment.jsp?id=" + productId + "&quantity=" + quantity + "&totalPrice=" + priceUpdate;

        window.location.href = redirectUrl;
    });
    
     var cartButton = document.getElementById("cartbutton");


     cartButton.addEventListener('click', function () {
	
	 displayQuantity = parseFloat(displayQuantity);
        if (displayQuantity < 1000 && displayQuantity > 200) {
            displayQuantity = displayQuantity / 1000;
        }
        

        let priceUpdate = displayQuantity * finalPrice;
        console.log(priceUpdate + "price");
        console.log(typeof finalPrice + "price");
        console.log(typeof displayQuantity + "quantity");
        productPrice.innerHTML = priceUpdate;
        console.log(typeof quantity + "mental");
        console.log(typeof productPrice + "loosu");
        let quant_div = Math.floor(quantity / 250);
        var totalPrice = quant_div * priceUpdate;
        console.log(totalPrice + "totalprice");
    window.location.href = "./CartServlet?productid=" + productId + "&quantity=" + quantity + "&price=" + priceUpdate;
});

});


