window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const onlyTax = 0.1;
    const Tax = onlyTax * inputValue
    addTaxDom.innerHTML = Math.floor(Tax)
    const addProfit = document.getElementById("profit");
    const onlyProfit = inputValue - Tax
    addProfit.innerHTML = Math.floor(onlyProfit)
  })
});

