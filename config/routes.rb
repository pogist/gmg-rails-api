Rails.application.routes.draw do
  scope '/api' do
    scope '/user' do
      get '/list', to: 'user#list'
      get '/:id', to: 'user#show'
      post '/login', to: 'user#login'
      post '/create', to: 'user#create'
    end
    scope '/product' do
      get '/search', to: 'product#search'
      get '/list', to: 'product#list'
      get '/:id', to: 'product#show'
      post '/:user_id/create', to: 'product#create'
    end
  end
end
