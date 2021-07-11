class UrlItem < ApplicationRecord
  belongs_to :folder, optional: false
  has_many :tags, optional: true
  validates :url, :name, presence: true, uniqueness: true
end
