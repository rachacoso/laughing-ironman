Rails.application.routes.draw do



resources :audits, only: [:new, :create, :show, :index]

resources :five_minute_summaries, only: [:show, :edit]
# resources :section, only: [:show, :edit, :update, :destroy]
resources :content_blocks, only: [:show, :edit, :update, :destroy]

resources :full_audits, only: [:show, :edit] do 
  resources :sections, only: [:index, :new, :create, :destroy, :show, :edit]
end


  # get 'audits/new' => 'audits#new', as: 'new_audit'

  # post 'audits/new' => 'audits#create', as: 'audits'
  
  # get 'audits/show' => 'audits#show'

  # get 'audits' => 'audits#index', as: 'index_audits'

  # get 'audits/fms/:id' => 'five_minute_summaries#show', as: 'five_minute_summary'

  # get 'audits/fms/editsection/:id' => 'sections#edit', as: 'edit_section'




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
