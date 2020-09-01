if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){ //newとeditのページのときのみ実行される
  window.addEventListener('load', function(){
    const priceForm = document.getElementById("item-price")
    const tax = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
  
    priceForm.addEventListener("change", (event) => {
      const price = document.getElementById("item-price").value;
      tax.innerHTML = price/100*10
      profit.innerHTML = price-price/100*10
   })
  })
};