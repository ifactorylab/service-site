Rails.application.routes.draw do
  scope '/sites' do
    post '/', to: 'sites#create'
    get '/', to: 'sites#index'
    get '/:id', to: 'sites#show'
    post '/:id/businesses', to: 'businesses#create'
    get '/:id/businesses', to: 'businesses#index'
  end

  scope '/businesses' do
    post '/:id/hours', to: 'hours#create'
    get '/:id/hours', to: 'hours#index'
  end

  patch '/hours/:id', to: 'hours#update'
  delete '/hours/:id', to: 'hours#destroy'
end
