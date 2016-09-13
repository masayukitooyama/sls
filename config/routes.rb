Rails.application.routes.draw do
  namespace :api, format: 'json' do
    get 'books' => 'books#index'
    post 'books' => 'books#create'
  end
  get 'books' => 'books#index'
  get 'book/:id' => 'books#show'
  root 'books#index'

end
