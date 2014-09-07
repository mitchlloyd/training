TrainingApp::Engine.routes.draw do
  resources :classroom, only: [:index]

  resources :registrations, only: :show

  resources :courses, only: [:index, :show] do
    get :theme, on: :member
    resources :registrations
  end

  namespace :api, defaults: {format: :json} do
    resources :sessions, only: :create
    resources :courses
    resources :discount_codes, only: :show
    resources :registrations do
      get :stats, on: :collection
    end
  end

  root to: 'courses#index'
end
