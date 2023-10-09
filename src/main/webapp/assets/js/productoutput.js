/**
 * 
 */



 const url = window.location.search;
 const params = new URLSearchParams(url)

	
  const productId = params.get("id");


    let increment1 = document.getElementById("increment")
    let pricelist = document.getElementById("quantity_of_product");
    let gramquantity=document.querySelector("gramquantity")
    console.log(increment1)
    let decrement1 = document.getElementById("decrement");


    let maxbtn = document.getElementById("increment")
    let minbtn = document.getElementById("decrement")
    let input = document.querySelector("input")
    let price = document.getElementById("quantity_of_product")
    let gram = document.getElementById("gram")
    let id = input.dataset.keyword
	console.log(id);
	
	 let gram_value;


    maxbtn.addEventListener("click",function () {
      

        let qty = parseFloat(input.value);
       
        if (qty < 20) { 
        	
        console.log(qty)
        
        qty = qty + 1
        
        console.log(qty)
        
        input.value = qty
        
        console.log(qty+" input")
        console.log(input.value)
        
        gram_value = 250 * input.value;
        
        console.log(gram_value,"gr");
        
        
        price.innerText = "Price : "+(id * input.value);
        
        	console.log(price.innerText);
        	}
        	
        	 if(gram_value >= 250){
          gram.innerText = "Quantity: "+gram_value+"g"
          
        	  console.log(gram_value)
        }
        
        if(gram_value >= 1000){
          gram.innerText = "Quantity: "+ (gram_value/1000) +"kg"
        }
        
       


    })
     //this event for decrease quantity value
        minbtn.addEventListener("click",function () {
        	
            if (input.value !== "1") {
            	
         let qty = parseFloat(input.value);
         qty = qty - 1
         input.value = qty
         let gram_value = 250 * input.value

         price.innerText = "Price : "+ (id * input.value)

         if(gram_value >= 250){
          gram.innerText = "Quantity: "+gram_value+"g"
        }
        if(gram_value >= 1000){
          gram.innerText = "Quantity: "+(gram_value/1000)+"kg"
        }
            }
    
        })	
        

        let buy = document.getElementById("buybutton");
    
    	buy.addEventListener("click",function(){
    			
   		 let price = id * input.value;
    	console.log(price+" price");
    	
    	let qunatitysss= input.value;

  		window.location.href= location.origin+"/greenfarm-web/payment.jsp?id="+productId+"&price="+price+"&gram="+gram_value+"&quantity="+qunatitysss;
  
    			
 	})        

  
        
        
      