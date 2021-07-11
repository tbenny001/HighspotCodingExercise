class UrlItem < ApplicationRecord
  belongs_to :folder
  has_many :tags
  validates :url, presence: true, uniqueness: true, format: { with: URI.regexp }
  validates :name, presence: true, uniqueness: true
end
