Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :reports, :only => [] do
      collection do
        get  :stock_requests
        post :stock_requests
      end
    end
  end
end
