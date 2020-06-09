Rails.application.routes.draw do
  resources :artworks do
    resources :artwork_parts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
