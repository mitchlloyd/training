var noop = function() { };

export default function() {
  window.Stripe = {setPublishableKey: noop};
}

