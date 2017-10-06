class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :text
      t.datetime :deleted_at
      t.boolean :published

      t.timestamps
    end
  end
end
