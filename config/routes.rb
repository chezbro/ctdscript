Rails.application.routes.draw do
  resources :font_categories

  get 'landings/index'

  root 'landings#index'

  post   "update_text"   => "landings#update_text",      as: :update_text

  post   "update_font_size"   => "landings#update_font_size",      as: :update_font_size

  resources :tattoos

  

end
