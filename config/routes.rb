Rails.application.routes.draw do
  
  
  devise_for :users

  root 'tweets#index'

  get 'tweets/:tweet_id/likes' => 'likes#create'
  get 'tweets/:tweet_id/likes/:id' => 'likes#destroy'
  resources :perfumes
  resources :users, only: [:show]
  resources :tweets do
    collection do
      get 'toudai'
      get 'toukoudai'
      get 'hitotubashi'
      get 'yokokoku'
      get 'waseda'
      get 'aogaku'
      get 'keio'
      get 'meiji'
      get 'sophia'
      get 'rikadai'
      get 'rikkyo'
      get 'chuo'
      get 'housei'
      get 'gakushuin'
      get 'nitidai'
      get 'toyo'
      get 'komazawa'
      get 'senshu'
      get 'seikei'
      get 'seijo'
      get 'meigaku'
      get 'dokkyou'
      get 'kokugakuin'
      get 'musashi'
      get 'tokai'
      get 'daitobunka'
      get 'teikyo'
      get 'kokushikan'
      get 'asia'
      

    end
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]

    
     end
  
   resources :maps, only: [:index]


end

 