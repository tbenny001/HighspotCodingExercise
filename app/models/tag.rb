class Tag < ApplicationRecord
    validates :name, uniqueness: true
    has_many :url_item_tags
    has_many :url_items, through: :url_item_tags
end
