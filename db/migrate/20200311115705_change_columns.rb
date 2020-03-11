class ChangeColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_baskets, :create
    remove_column :order_baskets, :destroy

    add_column :order_baskets, :order_id, :integer
    add_column :order_baskets, :basket_id, :integer

    rename_column :orders, :users_id, :user_id
    rename_column :orders, :baskets_id, :basket_id
  end
end
