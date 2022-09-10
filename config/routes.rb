Rails.application.routes.draw do
	scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :admins
    resources :categories
    resources :dishes
    resources :day_menus
    resources :day_menu_dishes
    resources :orders
    
  	root 'menu#index'
  end
end
