module TrainingApp
  module Api
    class SessionsController < ApplicationController
      def index
        session[:registration_code] = params[:registration_code]
        render json: { request_forgery_protection_token => form_authenticity_token }
      end
    end
  end
end
