class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string  :name
      t.string  :image
      t.integer :price
      t.integer :size
      t.string  :color
      t.string  :description
      t.boolean :status
      t.timestamps
    end
  end
end
