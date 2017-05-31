Rails.application.routes.draw do

  resources :equipment, except: [:show]
  get 'equipment/:id', to: 'equipment#show', as: 'equipment_show'

  get 'about', to: 'page#about'

  get 'contact', to: 'page#contact'

  root to: 'page#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
