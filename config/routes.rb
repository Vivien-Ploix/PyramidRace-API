Rails.application.routes.default_url_options[:host] = 'localhost:3000'


Rails.application.routes.draw do
    resources :game_histories, only: %w[show index create destroy]
    resources :games, only: %w[show index create destroy]
    resources :users, only: %w[show index]
    devise_for :users,
               path: '',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
               },
               controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
               }
end