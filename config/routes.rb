Rails.application.routes.draw do
  scope 'api' do
    get 'user/:id', to: 'user#show'
    post 'user/create', to: 'user#create'
  end
end
