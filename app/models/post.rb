class Post < ApplicationRecord
  sample_filter(
    title: {type: :string},
    published: {type: :boolean},
    created_at: {type: :date},
    sort: {type: :sorting, values: [:title, :created_at], default_value: 'created_at_desc'}
  )

  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, presence: :true

  self.per_page = 20


  def soft_delete!
    update(deleted_at: Time.now)
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.mb_chars.strip.downcase.to_s).first_or_create!
    end
  end
end
