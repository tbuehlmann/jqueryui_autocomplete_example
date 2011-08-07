JqueryuiAutocompleteExample::Application.routes.draw do
  resources :movies do
    get 'autocomplete', :on => :collection
  end
  root :to => 'movies#index'
end

