class UrlItem < ApplicationRecord
  belongs_to :folder
  has_many :tags
  validates :url, :name, presence: true, uniqueness: true
end
