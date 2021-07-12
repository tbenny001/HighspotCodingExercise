class UrlItem < ApplicationRecord
  belongs_to :folder
  has_many :url_item_tags
  has_many :tags, through: :url_item_tags
  validates :url, presence: true, uniqueness: true, format: { with: URI.regexp }
  validates :name, presence: true
end
