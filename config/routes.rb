Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'menus#index'
  get 'menu', to: 'menus#getMenu', as: 'get_menu'

end
