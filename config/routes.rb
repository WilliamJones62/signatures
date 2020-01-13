Rails.application.routes.draw do
  get 'signature/index'
  get 'signature/invoice'
  get 'signature/selected'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'signature#index'
end
