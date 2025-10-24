// app/javascript/price.js
import "payjp"; // ← PayJPスクリプトを読み込む


const price = () => {
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
      const tax = Math.floor(inputValue * 0.1);   // 販売手数料
      const profit = Math.floor(inputValue - tax); // 販売利益
      taxDom.innerHTML = tax;
      profitDom.innerHTML = profit;
    }
  });
};


const pay = () => {
  const payjpPublicKey = document
    .querySelector('meta[name="payjp-public-key"]')
    ?.getAttribute("content");

  if (!payjpPublicKey) {
    console.error("PAYJP_PUBLIC_KEY が読み込めませんでした。");
    return;
  }

  const payjp = Payjp(payjpPublicKey);
  const elements = payjp.elements();

  const numberElement = elements.create("cardNumber");
  const expiryElement = elements.create("cardExpiry");
  const cvcElement = elements.create("cardCvc");

  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form");
  cvcElement.mount("#cvc-form");

  const form = document.getElementById("charge-form");
  if (!form) return;

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then((response) => {
      if (response.error) {
        alert("カード情報が正しくありません。");
      } else {
        const token = response.id;

        const hiddenToken = document.createElement("input");
        hiddenToken.setAttribute("type", "hidden");
        hiddenToken.setAttribute("name", "token");
        hiddenToken.setAttribute("value", token);
        form.appendChild(hiddenToken);

        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();
        form.submit();
      }
    });
  });
};


window.addEventListener("turbo:load", () => {price();pay();});
window.addEventListener("turbo:render", () => {price();pay();});