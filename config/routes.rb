Rails.application.routes.draw do
  resources :materials

  resources :ingredients

  resources :historial_de_compras

  resources :subcategories

  resources :categories

  resources :procedures

  resources :recipes

  get 'welcome/index'

  get 'welcome/contact'

  get 'welcome/aboutUs'

  resources :articulos

  resources :comandas

  resources :orders

  resources :rols

  resources :users

  resources :password_resets
#rutas especificas de usuarios
  controller :users do
    get 'recover_password' => :recover_password
    post 'recover_password' => :recover_password
    get 'new_recover_password' => :new_recover_password
    post 'new_recover_password' => :new_recover_password
    get 'cambiar_password' => :cambiar_password
    post 'cambiar_password' => :cambiar_password
    get 'new_cambiar_password' => :new_cambiar_password
    post 'new_cambiar_password' => :new_cambiar_password
  end
#rutas especificas de session
controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'
  controller :orders do
    get 'pago_nuevo' => :pago_nuevo
    post 'pago_nuevo' => :pago_nuevo
    get 'envio_c' => :envio_c
  end

  controller :recipes do
    get "receta/:id/agregar_proceso" => :procesos, :as => 'or_proceso'
    get "receta/:id/agregar_material" => :material, :as => 'or_material'
    get "receta/:id/agregar_ingrediente" => :ingrediente , :as => 'or_ingrediente'
    post "receta/procesos" => :asignar_ingrediente, :as => 'as_ingredientes'
    post "receta/material" => :asignar_material, :as => 'as_materiales'
    post "receta/ingredientes" => :asignar_procesos, :as => 'as_procesos' 
  end

  ##ruta opcional para atrapar rutas que no son
  get '*unmatched_route', :to => 'application#raise_not_found2'    


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
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
