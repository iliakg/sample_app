class CreateFileItems < ActiveRecord::Migration[5.1]
  def change
    create_table :file_items do |t|
      t.string :name
      t.string :namehash
      t.string :attached_file

      t.timestamps
    end
  end
end
