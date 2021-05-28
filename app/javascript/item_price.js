window.addEventListener('load', () => {
  console.log("OK");




  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));

    const addTaxDom2 = document.getElementById("profit");
    addTaxDom2.innerHTML = (Math.floor(inputValue - (inputValue * 0.1)));

    
})

});