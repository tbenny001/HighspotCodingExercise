class UrlItem < ApplicationRecord
  belongs_to :folder, optional: false
  validates :url, :name, presence: true, uniqueness: true
end
