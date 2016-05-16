Rails.application.routes.draw do
  scope '/api' do
    get '/user/:id', to: 'user#show'
    get '/user/list', to: 'user#all'
    post '/user/create', to: 'user#create'
  end
end
