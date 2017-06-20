Rails.application.routes.draw do

  resources :bookings
  devise_for :users, path:'', path_names: {sign_in: 'login', sign_out: 'logout'}

  resources :projects, except: [:show]

  resources :equipment, except: [:show]

  get 'projects/:id', to: 'projects#show', as: 'project_show'

  get 'electric-equipment', to: 'equipment#el'

  get 'measuring-equipment', to: 'equipment#measure'

  get 'audio-equipment', to: 'equipment#audio'

  get 'video-equipment', to: 'equipment#video'

  get 'software', to: 'equipment#software'

  get 'misc-equipment', to: 'equipment#misc'

  get 'equipment/:id', to: 'equipment#show', as: 'equipment_show'

  get 'about', to: 'page#about'

  get 'contact', to: 'page#contact'

  root to: 'page#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
