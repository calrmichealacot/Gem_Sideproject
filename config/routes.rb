Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  constraints(ClientDomainConstraint.new) do
    resources :home do

    end
  end
 constraints(AdminDomainConstraint.new) do
     namespace :admin do
       resources :users
     end
 end
end