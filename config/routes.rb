Vulcainapp::Application.routes.draw do
  scope('/api') do
    resources :customers
    resources :projects
    resources :invoices
    resources :articles
  end
  
  match '/:action', :controller => :pages, :as => :page_action
  root :to => "pages#dashboard"
end
