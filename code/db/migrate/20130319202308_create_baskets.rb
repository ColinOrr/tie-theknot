class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.string :shopper
      t.text :message
      t.string :status, :default => 'Open'

      t.timestamps
    end
  end
end
