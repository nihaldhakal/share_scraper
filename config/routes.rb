Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shares
  get 'shares/:id/earnings_per_shares',to:'shares#earnings_per_shares', as: 'earnings_per_shares'
  root "shares#index"
end
