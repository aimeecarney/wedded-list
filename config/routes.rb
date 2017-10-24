Rails.application.routes.draw do
  resources :list_contacts
  resources :lists
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'welcome#home'
    devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
