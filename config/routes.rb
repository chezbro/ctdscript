Rails.application.routes.draw do
  resources :font_categories

  get 'landings/index'

  root 'landings#index'

  post   "update_text"   => "landings#update_text",      as: :update_text

  get   "font_category_selection"   => "landings#font_category_selection",      as: :font_category_selection

  resources :tattoos



  

end
