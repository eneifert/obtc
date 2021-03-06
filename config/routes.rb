Obtc::Application.routes.draw do

  get "staff/eric"
scope "(:locale)", locale: /en|ru|kg/ do

  get "emails/success", to: "emails#success"
  resources :emails  

  get "home/index"
  get "about", to: "home#about" 
  get "contact", to:  "home#contact"

  get "projects/cashmere"
  get "projects/webdevelopment"
  get "projects/english"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get "eric", to: "staff#eric"


  get "mail", "email", to: redirect {"https://webmail.webfaction.com/"}

  # You can have the root of your site routed with "root"  
  get '/:locale' => 'home#index'
  root :to => 'home#index', :as => :root_with_locale
end

  root :to => 'application#detect_language'
  # root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
