Rails.application.routes.default_url_options[:host] = 'localhost:3000'


Rails.application.routes.draw do
    resources :game_histories, only: %w[show index create destroy]
    resources :games, only: %w[show index create destroy update]
    get '/games/:id/game_histories', to: 'games#game_histories'
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
    get '/users/:id/games', to: 'users#user_games'
    get '/users/:id/games_to_play', to: 'users#user_games_to_play'
    get '/users/:id/possible_opponents', to: 'users#possible_opponents'



end