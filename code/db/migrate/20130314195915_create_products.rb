class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image
      t.decimal :price
      t.integer :quantity
      t.string :category
      t.integer :priority, :default => 0

      t.timestamps
    end
  end
end
