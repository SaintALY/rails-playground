Rails.application.routes.draw do
  resources :toptens

  # Rails Wiki
  get "/railswiki", to: "railswiki#index"
  get "/railswiki/new", to: "railswiki#new"
  post "/railswiki", to: "railswiki#create"
  get "/railswiki/:id", to: "railswiki#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
