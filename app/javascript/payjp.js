const pay = () => {
  const form = document.getElementById("charge-form");
  if (!form) return;

  const publicKey = document.querySelector('meta[name="payjp-public-key"]').content;
  const payjp = window.Payjp(publicKey);
  const elements = payjp.elements();

  const numberElement = elements.create("cardNumber");
  const expiryElement = elements.create("cardExpiry");
  const cvcElement = elements.create("cardCvc");

  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form");
  cvcElement.mount("#cvc-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        alert(response.error.message);
      } else {
        const token = response.id;
        const tokenObj = `<input value=${token} name='token' type='hidden'>`;
        form.insertAdjacentHTML("beforeend", tokenObj);
      }

      form.submit();
    });
  });
};

window.addEventListener("turbo:load", pay);