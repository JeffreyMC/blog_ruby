Rails.application.routes.draw do
  get 'welcome/about'
  get 'welcome/index'
  root 'welcome#index' #página principal
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
