JqueryuiAutocompleteExample::Application.routes.draw do
  resources :movies
  root :to => 'movies#index'
end

