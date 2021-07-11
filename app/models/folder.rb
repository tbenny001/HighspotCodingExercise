class Folder < ApplicationRecord
    validates :name, uniqueness: true
end
