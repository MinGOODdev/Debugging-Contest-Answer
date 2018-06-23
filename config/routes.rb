Rails.application.routes.draw do
  devise_for :users
  
  #root '/'
  root 'home#index'
  
  #post routes
  get 'home/index'
  
  get 'home/new'
  
  post 'home/create'
  
  
  #get 'home/delete/:post_id' -> 'home#delete'
  get 'home/delete/:post_id' => 'home#delete'
  
  #get 'home/edit/:post_id' -> 'home#edit'
  get 'home/edit/:post_id' => 'home#edit'
  
  #get 'home/update/:post_id' -> 'home#update'
  post 'home/update/:post_id' => 'home#update'
  
  
  #comment routes
  #post '/home/index/:post_id/create' -> 'comment#create'
  post '/home/index/:post_id/create' => 'comments#create'

  #get 'comments/delete/:comment_id' -> 'comment#delete'
  get 'comments/delete/:comment_id' => 'comments#delete'
end
