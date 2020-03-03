class AddColumnToBaskets < ActiveRecord::Migration[5.2]
  def change
    add_column :baskets, :stock, :integer

    remove_foreign_key :products, :restaurants
    remove_column :products, :restaurant_id
  end
end
