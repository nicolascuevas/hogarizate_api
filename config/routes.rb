Rails.application.routes.draw do
  resources :constants
  resources :contact_forms
  resources :communes
  devise_for :users, :controllers => { registrations: 'users/registrations',sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'contact_forms#index'

  get 'constants/:name/by_name', to: 'constants#by_name', as: 'show_by_name'

  resources :examples, only: :index do
    get :buttons, :cards, :utilities_color, :utilities_border,
        :utilities_animation, :utilities_other, :login, :register,
        :forgot_password, :page_404, :blank, :charts, :tables,
        on: :collection
  end
end
