const pay = () => {

  const payjpPublicKey = document
    .querySelector('meta[name="payjp-public-key"]')
    ?.getAttribute('content');

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


window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);