class AddContentTypeToFileItem < ActiveRecord::Migration[5.1]
  def change
    add_column :file_items, :content_type, :string
  end
end
