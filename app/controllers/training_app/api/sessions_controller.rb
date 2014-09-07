module TrainingApp
  module Api
    class SessionsController < ApplicationController
      def index
        session[:registration_code] = params[:registration_code]
        render json: {
          request_forgery_protection_token => form_authenticity_token,
          'stripe_public_key' => ENV.fetch('STRIPE_PUBLIC', 'pk_ORgnt3pE5xPZNlICVgocPDCYYYce3')
        }
      end
    end
  end
end
