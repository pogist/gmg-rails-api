Rails.application.routes.draw do
  scope 'api' do
    get 'user/:id', to: 'user#show'
  end
end
