Rails.application.routes.draw do
  
  root 'pages#index'
  resources :libraries do
    resources :books, except: [:new, :edit]
  end

end
