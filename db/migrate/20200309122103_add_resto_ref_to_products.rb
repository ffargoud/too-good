class AddRestoRefToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :restaurant, foreign_key: true
  end
end
