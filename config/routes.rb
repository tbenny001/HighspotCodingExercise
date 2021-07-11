Rails.application.routes.draw do
  get 'tags', to: "tags#index"
  get 'folders', to: "folders#index"
end
