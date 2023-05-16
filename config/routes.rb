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