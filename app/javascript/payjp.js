const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);
  const elements = payjp.elements();
  const numberElement = elements.create("cardNumber");
  const expiryElement = elements.create("cardExpiry");
  const cvcElement = elements.create("cardCvc");

  numberElement.mount("#card-number");
  expiryElement.mount("#card-exp");
  cvcElement.mount("#card-cvc");

  const form = document.getElementById("charge-form");
  if (!form) return; // ページにフォームがなければ処理しない

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

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);