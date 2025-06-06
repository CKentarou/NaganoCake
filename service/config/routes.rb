Rails.application.routes.draw do
  namespace :public do
    get 'cart_items/index'
  end
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  namespace :public do
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
  end
end
