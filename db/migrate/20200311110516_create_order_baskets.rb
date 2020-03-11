class CreateOrderBaskets < ActiveRecord::Migration[5.2]
  def change
    create_table :order_baskets do |t|
      t.string :create
      t.string :destroy

      t.timestamps
    end
  end
end
