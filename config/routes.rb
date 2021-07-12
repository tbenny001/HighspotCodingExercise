Rails.application.routes.draw do
  scope 'folders', controller: "folder" do
    get 'index', to: "folders#index", as: :folders_index
    post 'create', to: "folders#create", as: :folder_creation
  end

  scope 'tags', controller: "tag" do
    get 'index', to: "tags#index", as: :tags_index
    post 'create', to: "tags#create", as: :tag_creation
  end

  scope 'url_items', controller: "url_items" do
    post 'create', to: "url_items#create", as: :url_item_creation
    post 'search', to: "url_items#search", as: :url_item_search
  end
end
