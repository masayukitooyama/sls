class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :book_id, null: false
      t.integer :user_id, null: false
      t.datetime :limit_date, null: false
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
