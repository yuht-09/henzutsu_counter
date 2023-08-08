Rails.application.routes.draw do
  get 'search', to: "weathers#search"

  get 'show', to: 'weathers#show'
end
