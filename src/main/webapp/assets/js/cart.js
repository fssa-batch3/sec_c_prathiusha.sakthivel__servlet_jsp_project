    var removeButton = document.querySelectorAll(".removeButton");
    var totalamount=document.querySelectorAll(".price").innerText;
    if (removeButton!=null) {
		removeButton.forEach((e,i)=>{
		   e.addEventListener('click', el=> {
			  console.log("Remove button clicked");
            window.location.href = "./RemoveCart?cart_id=" +e.getAttribute("key");
        });
		})
     
    } else {
        console.error("Element not found.");
    }

    
document.getElementById('checkoutButton').addEventListener('click', function() {
    getSelectedCartIds();
});

function getSelectedCartIds() {
    var checkboxes = document.querySelectorAll('.checkbox:checked');
    var selectedIds = [];

    checkboxes.forEach(function(checkbox) {
        selectedIds.push(checkbox.id);
    });

    if (selectedIds.length > 0) {

        if(selectedIds.length>1){
            var selectedIdsParam = selectedIds.join(',');
            window.location.href = './AllCheckoutServlet?id=' + selectedIdsParam;
        }else {

            window.location.href = './AllCheckoutServlet?id=' + selectedIds[0]+",";
        }

    } else {
        alert('Please select at least one product.');
    }
}