/* globals Stripe */

// TODO: Get public Stripe key from the server.
export default {
  name: 'stripe',
  initialize: function() {
    Stripe.setPublishableKey("pk_ORgnt3pE5xPZNlICVgocPDCYYYce3");
  }
};
