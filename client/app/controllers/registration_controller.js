/* globals Stripe */
import Ember from 'ember';
var computedOr = Ember.computed.or,
    computedEqual = Ember.computed.equal;

export default Ember.ObjectController.extend({
  needs: ['flash'],
  purchasePending: false,
  discountPending: false,
  registrationErrors: null,
  cardErrors: null,

  actions: {
    submit: function() {
      this.set('cardErrors', null);
      this.set('purchasePending', true);
      if (this.get('isFree')) {
        return this.save();
      } else {
        return this.submitWithCreditCard();
      }
    }
  },

  currentPrice: (function() {
    if (this.get('discountedPrice') != null) {
      return this.get('discountedPrice');
    } else {
      return this.get('course.price');
    }
  }).property('course.price', 'discountedPrice'),

  isDiscounted: (function() {
    return this.get('discountedPrice') != null;
  }).property('discountedPrice'),

  cardProperties: (function() {
    return this.get('card').getProperties('name', 'number', 'expMonth', 'expYear');
  }).property('card.name', 'card.number', 'card.expMonth', 'card.expYear'),

  discountCodeURL: (function() {
    return "/training/api/discount_codes/" + (this.get('discountCode'));
  }).property('discountCode'),

  discountCodeDidChange: (function() {
    return Ember.run.throttle(this, 'fetchDiscount', 300);
  }).observes('discountCode'),

  creditCardFormDisabled: computedOr('purchasePending', 'isFree'),

  isFree: computedEqual('discountedPrice', 0),

  submitWithCreditCard: function() {
    return Stripe.createToken(this.get('cardProperties'), (function(_this) {
      return function(status, response) {
        if (status === 200) {
          return _this.handleStripeSuccess(response);
        } else {
          return _this.handleStripeError(response);
        }
      };
    })(this));
  },

  handleStripeSuccess: function(response) {
    this.set('stripe_token', response.id);
    return this.save();
  },

  handleStripeError: function(response) {
    this.set('cardErrors', response.error.message);
    return this.set('purchasePending', false);
  },

  save: function() {
    return this.get('model').save().then(this.handleRegistrationSuccess.bind(this), this.handleRegistrationError.bind(this));
  },

  handleRegistrationSuccess: function(registration) {
    return registration.get('course').reload().then((function(_this) {
      return function() {
        _this.get('controllers.flash').add("Thanks for purchasing!");
        return _this.transitionToRoute('course', registration.get('course'));
      };
    })(this));
  },

  handleRegistrationError: function(response) {
    this.set('purchasePending', false);
    if (response.responseJSON != null) {
      return this.set('registrationErrors', response.responseJSON.error_message);
    } else {
      return this.set('registrationErrors', "Oops! Something went wrong. Please send an email to training@gaslight.co and we'll get you setup.");
    }
  },

  fetchDiscount: function() {
    if (!((this.get('discountCode') != null) && this.get('discountCode').length > 2)) {
      return;
    }
    this.set('discountPending', true);
    return Ember.$.getJSON(this.get('discountCodeURL')).then(this.handleDiscountSuccess.bind(this), this.handleDiscountError.bind(this));
  },

  handleDiscountSuccess: function(response) {
    this.set('discountedPrice', response.discount_code.price);
    return this.set('discountPending', false);
  },

  handleDiscountError: function() {
    return this.set('discountPending', false);
  }
});
