Rails.application.routes.draw do
  scope 'folders', controller: "folder" do
    get 'folders', to: "folders#index", as: :folders_index
    post 'folders/create/', to: "folders#create", as: :folder_creation
  end

  scope 'tags', controller: "tag" do
    get 'tags', to: "tags#index", as: :tags_index
    post 'tags/create/', to: "tags#create", as: :tag_creation
  end

  scope 'url_items', controller: "url_items" do
    post 'url_items/create/', to: "url_items#create", as: :url_item_creation
  end
end
