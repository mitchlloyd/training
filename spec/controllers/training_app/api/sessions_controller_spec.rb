require 'spec_helper'

module TrainingApp
  module Api
    describe SessionsController do
      describe "GET sessions" do
        before do
          get :index, registration_code: "123", use_route: :training
          @payload = JSON.parse(response.body)
        end

        it "sets the registration code on the session" do
          expect(session[:registration_code]).to eq("123")
        end

        it "returns the stripe public key token" do
          expect(@payload['stripe_public_key']).to be_a(String)
        end

        it "returns an authenticity token" do
          expect(@payload['authenticity_token']).to be_a(String)
        end
      end
    end
  end
end
