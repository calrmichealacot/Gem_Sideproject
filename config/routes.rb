Rails.application.routes.draw do

  root 'home#index'
  constraints(ClientDomainConstraint.new) do
    devise_for :users, as: 'admin', controllers: { sessions: 'admin/sessions' }
    resources :home do
      resources :profiles

    end
  end
 constraints(AdminDomainConstraint.new) do
   devise_for :users, as: 'client', controllers: { sessions: 'client/sessions', registrations: 'client/registrations' }
     namespace :admin do
       resources :users
     end
 end
end

namespace :api do
  namespace :v1 do
    resources :regions, only: %i[index show], defaults: { format: :json } do
      resources :provinces, only: :index, defaults: { format: :json }
    end
    resources :provinces, only: %i[index show], defaults: { format: :json } do
      resources :cities, only: :index, defaults: { format: :json }
    end
    resources :cities, only: %i[index show], defaults: { format: :json } do
      resources :barangays, only: :index, defaults: { format: :json }
    end
    resources :barangays, only: %i[index show], defaults: { format: :json }
  end
end