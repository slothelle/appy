Loveknit::Application.routes.draw do
  resources :users
  resources :patterns do
    resources :abbreviations
    resources :images
    resources :charts
    resources :chart_legends
    resources :comments
    resources :sections do
      resources :rows
    end
  end
  resources :sessions, only: [:new, :create, :destroy]

  get     '/sign_up',   to: 'users#new'
  get     '/log_in',    to: 'sessions#new'
  delete  '/log_out',   to: 'sessions#destroy'

  root :to => 'sessions#new'
end
