class CreateBaskets < ActiveRecord::Migration[5.2]
  def change
    create_table :baskets do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.date :date
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
