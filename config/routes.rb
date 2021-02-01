Rails.application.routes.draw do
  devise_for :users
  get 'tops/index'
  root to: 'tops#index'
  resources :contests, except: [:destory] do
    collection do
      get 'list'

      get 'finished'
    end
  end
end
