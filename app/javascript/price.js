window.addEventListener('load', function(){
  const priceForm = document.getElementById("item-price")        // priceFormという変数にid=item-priceを入れる
  const tax = document.getElementById("add-tax-price")           // taxという変数にid=add-tax-priceを入れる
  const profit = document.getElementById("profit")               // profitという変数にid=profitを入れる

  priceForm.addEventListener("change", (event) => {              // changeイベント発火
    const price = document.getElementById("item-price").value;   // valueで入力された値を取得
    tax.innerHTML = price/100*10                                 // taxに表示させる
    profit.innerHTML = price-price/100*10                        //profitに表示させる
 })
})