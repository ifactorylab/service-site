Rails.application.routes.draw do
  scope '/sites' do
    post '/', to: 'sites#create'
    get '/', to: 'sites#index'
    get '/:id', to: 'sites#show'
    post '/:id/businesses', to: 'businesses#create'
    get '/:id/businesses', to: 'businesses#index'
  end

  post 'businesses/:id/hours', to: 'hours#create'
  get 'businesses/:id/hours', to: 'hours#index'
end
