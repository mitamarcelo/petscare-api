Rails.application.routes.draw do
  get '/pets/options', to: 'pets#options'
  get '/procedure_categories', to: 'procedures#categories'

  resources :pets, only: %i[create update destroy index show] do
    resources :procedures, only: %i[create update destroy index show]
  end

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
  delete 'logout', to: 'users#logout'
end
