Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  resources :pokemons
  put "/pokemon/capture(.:format)", to: "pokemons#capture", as: :capture
  #resources :pokemons, as: :capture, path:"pokemon/capture"
  patch "/pokemon/:id/damage", to: "pokemons#damage", as: :damage
  #post "pokemon/new", to: "pokemons#new", as: :new
end