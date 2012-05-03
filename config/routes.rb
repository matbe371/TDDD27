TDDD27::Application.routes.draw do

  #Länkar rooten till indexssidan.
  root :to => 'static_pages#home'
  
  #RESTful path. Genererar automatist paths till actions: index, show, new och edit.
  resources :song_questions
  resources :trivia_questions
  resources :album_questions
  
  #Sökvägar som begärs via URL-metoden GET.
  get "quiz/play"
  get "quiz/result"
  get "quiz/question_result"
  get "quiz/show_question"
  get "static_pages/home"
  
  #Anpassade sökvägar :to => 'controller#action'.
  match '/play', :to => 'quiz#play'
  match '/result',   :to => 'quiz#result'
  match '/question_result', :to=> 'quiz#question_result'
  match '/show', :to=> 'quiz#show_question'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
