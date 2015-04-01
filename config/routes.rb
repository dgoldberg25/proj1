Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  resources :pokemons, as: :capture, path:"pokemon/capture"
  put "/pokemon/capture(.:format)", to: "pokemons#capture"
  put "/trainers/:id(.:format)", to: "pokemons#damage", as: :damage, path: "pokemon/damage"
end