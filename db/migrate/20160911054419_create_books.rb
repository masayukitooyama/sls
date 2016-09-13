class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn, null: false
      t.string :book_name
      t.text   :image_url
      t.integer :stocks
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
