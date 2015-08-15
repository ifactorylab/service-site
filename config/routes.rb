Rails.application.routes.draw do
  scope '/sites' do
    post '/', to: 'sites#create'
    get '/', to: 'sites#index'
    get '/:id', to: 'sites#show'
    patch '/:id', to: 'sites#update'
    post '/:id/businesses', to: 'businesses#create'
    get '/:id/businesses', to: 'businesses#index'
    get '/:id/style', to: 'styles#index'
    post '/:id/booking', to: 'bookings#create'
    get '/:id/bookings', to: 'bookings#index'
  end

  scope '/businesses' do
    post '/:id/hours', to: 'hours#create'
    get '/:id/hours', to: 'hours#index'
  end

  patch '/hours/:id', to: 'hours#update'
  delete '/hours/:id', to: 'hours#destroy'

  patch 'style/:id', to: 'styles#update'
  patch 'style/:id/logo', to: 'styles#upload'

  scope '/bookings' do
    get '/:id', to: 'bookings#show'
    patch '/:id', to: 'bookings#update'
    patch '/:id/confirm', to: 'bookings#confirm'
    patch '/:id/reject', to: 'bookings#reject'
    delete '/:id', to: 'bookings#destroy'
  end
end
