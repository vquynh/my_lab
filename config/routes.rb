Rails.application.routes.draw do

  get "admin-board" => "admin_board#show"

  get 'booking_items/create'

  get 'booking_items/update'

  get 'booking_items/destroy'

  get 'mylist', to: 'list#show'
  get 'booklist', to: 'list#add_list_to_booking'

  devise_for :users, path:'', path_names: {sign_in: 'login', sign_out: 'logout'}

  resources :projects, except: [:show]

  resources :equipment, except: [:show]

  resource :list

  resources :booking_items, only: [:create, :update, :destroy]

  resources :bookings do
      get 'indexadmin', on: :collection
  end

  get 'projects/:id', to: 'projects#show', as: 'project_show'

  get 'electric-equipment', to: 'equipment#el'

  get 'measuring-equipment', to: 'equipment#measure'

  get 'audio-equipment', to: 'equipment#audio'

  get 'video-equipment', to: 'equipment#video'

  get 'computer-equipment', to: 'equipment#computer'

  get 'misc-equipment', to: 'equipment#misc'

  get 'equipment/:id', to: 'equipment#show', as: 'equipment_show'

  get 'about', to: 'page#about'

  get 'contact', to: 'page#contact'


  root to: 'page#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
