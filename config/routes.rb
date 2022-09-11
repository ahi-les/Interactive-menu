Rails.application.routes.draw do
	scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'menu#index'
    devise_for :admins
    resources :categories
    resources :dishes
    resources :day_menus
    resources :day_menu_dishes
    resources :orders
    
  	
  end
end
