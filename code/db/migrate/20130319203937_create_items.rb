class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :product_id
      t.integer :basket_id
      t.decimal :price

      t.timestamps
    end
  end
end
