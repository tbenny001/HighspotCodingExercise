class UrlItemTag < ApplicationRecord
  belongs_to :url_item
  belongs_to :tag
end
