class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.decimal :amount
      t.boolean :purchased
      t.string :buyer
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
