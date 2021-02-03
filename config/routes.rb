Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    post 'users/sign_up/confirm', to: 'users/registrations#confirm'
    get 'users/sign_up/complete', to: 'users/registrations#complete'
  end

  get 'tops/index'
  root to: 'tops#index'
  resources :contests, except: [:destory] do
    collection do
      get 'list'

      get 'finished'
    end
    resources :works do
      collection do
        get 'finished'
      end
    end
  end

  resources :users
end
