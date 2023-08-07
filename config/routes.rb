Rails.application.routes.draw do
  get 'seach', to: "weathers#seach"

  get 'show', to: 'weathers#show'
end
