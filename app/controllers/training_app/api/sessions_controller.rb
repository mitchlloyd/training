module TrainingApp
  module Api
    class SessionsController < ApplicationController
      def create
        session[:registration_code] = params[:registration_code]
        render json: {}
      end
    end
  end
end
