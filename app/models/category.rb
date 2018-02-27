class Category < ApplicationRecord
  NESTED_LEVEL_LIMIT = 3

  belongs_to :parent, class_name: 'Category', optional: true

  validates :title, presence: :true
  validate :nested_limit_validation, on: :create

  def parents
    parents_arr = []
    category = self

    loop do
      break unless category.parent.present?

      parents_arr << category.parent
      category = category.parent
    end

    parents_arr
  end

  private

  def nested_limit_validation
    if parents.count >= NESTED_LEVEL_LIMIT
      error_text = I18n.t('activerecord.errors.models.category.attributes.parent_id.limit')
      errors.add(:parent_id, error_text)
    end
  end
end
