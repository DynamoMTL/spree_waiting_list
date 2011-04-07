Rails.application.routes.draw do
  resources :stock_requests

  namespace :admin do
    resources :reports, :only => [:index, :show] do
      get 'stock_requests', :on => :collection
    end
  end
end
