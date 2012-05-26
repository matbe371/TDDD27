TDDD27::Application.routes.draw do

  get "albums/new"

  get "albums/create"

  get "songs/new"

  get "songs/create"

  get "artists/create"

  get "artists/new"

  #Länkar rooten till indexssidan.
  root :to => 'static_pages#home'
  
  #RESTful path. Genererar automatist paths till actions: index, show, new och edit.
  resources :users
  resources :sessions, only: [:new, :create, :destroy] #behöver inga controller för edit och show.
  resources :artists, only: [:new, :create]
  resources :songs, only: [:new, :create]
  resources :albums, only: [:new, :create]
  resources :trivia_questions, only: [:new, :create]
  resources :song_questions, only: [:new, :create]
  resources :album_questions, only: [:new, :create]
  
  
  #Sökvägar som begärs via URL-metoden GET.
  get "quiz/confirm"
  get "quiz/play"
  get "quiz/result"
  get "quiz/question_result"
  get "quiz/show_question"
  get "static_pages/home"
  get "static_pages/instructions"
  
  #Anpassade sökvägar :to => 'controller#action'.
  match '/instructions', :to=> 'static_pages#instructions'
  match '/sitebrowser', :to=> 'static_pages#new'
  match '/newartist', :to=> 'artists#new'
  match '/newsong', :to=> 'songs#new'
  match '/step1songs', :to=> 'songs#step1'
  match '/step2songs', :to=> 'songs#new'
  match '/step1albums', :to=> 'albums#step1'
  match '/step2albums', :to=> 'albums#new'
  match '/step1trivia', :to=> 'trivia_questions#step1'
  match '/step2trivia', :to=> 'trivia_questions#new'
  match '/step1songquestion', :to=> 'song_questions#step1'
  match '/step2songquestion', :to=> 'song_questions#new'
  match '/step1albumquestion', :to=> 'album_questions#step1'
  match '/step2albumquestion', :to=> 'album_questions#new'
  match '/confimrmed', :to=> 'static_pages#confirmed'
  match '/fail', :to=> 'static_pages#fail'
  match '/confirm', :to=> 'quiz#confirm'
  match '/play', :to => 'quiz#play'
  match '/result',   :to => 'quiz#result'
  match '/question_result', :to=> 'quiz#question_result'
  match '/show', :to=> 'quiz#show_question'
  match '/signup', :to=> 'users#new'
  match '/signin',  :to=> 'sessions#new'
  match '/signout', :to=> 'sessions#destroy', via: :delete
  match '/new_trivia',  :to=> 'trivia_questions#new'
  match '/new_song',  :to=> 'song_questions#new'
  match '/new_album',  :to=> 'album_questions#new'
  

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
