function amountCalculation() {

  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString()
  const salesProfit = document.getElementById("profit")
      salesProfit.innerHTML = Math.ceil(inputValue * 0.9).toLocaleString()
  })
};

window.addEventListener('load',amountCalculation )
