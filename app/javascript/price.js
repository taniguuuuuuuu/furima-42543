window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const inputValue = parseInt(priceInput.value, 10);

    const taxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    if (isNaN(inputValue)) {
      taxDom.innerHTML = "";
      profitDom.innerHTML = "";
    } else {
      const tax = Math.floor(inputValue * 0.1);
      const profit = Math.floor(inputValue - tax);
      taxDom.innerHTML = tax;
      profitDom.innerHTML = profit;
    }
  });
});