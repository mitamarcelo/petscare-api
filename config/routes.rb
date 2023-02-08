Rails.application.routes.draw do
  resources :pets, only: %i[create update destroy index show] do
    resources :procedures, only: %i[create update destroy index show]
  end

  get '/procedure_categories', to: 'procedures#categories'

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
