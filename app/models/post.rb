class Post < ApplicationRecord

  validates :title, presence: :true

  self.per_page = 20


  def soft_delete!
    update(deleted_at: Time.now)
  end
end
