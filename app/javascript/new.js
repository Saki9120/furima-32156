function price (){
  const itemPrice = document.getElementById("item-price");
   itemPrice.addEventListener("keyup", () => {
     const charge = (itemPrice.value * 0.1);
     const gain = (itemPrice.value * 0.9);
     const addTaxPrice = document.getElementById("add-tax-price");
     addTaxPrice.innerHTML = `${charge}`;
     const profit = document.getElementById("profit");
     profit.innerHTML = `${gain}`;
   });
 }
 
 window.addEventListener('load', price);