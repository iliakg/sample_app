class Page < ApplicationRecord
  validates :slug, presence: :true
end
