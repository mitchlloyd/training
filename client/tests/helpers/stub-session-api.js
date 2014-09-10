import Pretender from 'pretender';

function sessionResponse() {
  this.get('/training/api/sessions', function(request){
    var payload = {
      authenticity_token: 'fake-csrf-token',
      stripe_public_key: 'fake-stripe-key'
    };

    return [200, {"Content-Type": "application/json"}, JSON.stringify(payload)];
  });
}

export default function() {
  return new Pretender(sessionResponse);
}
