class AddDefaultToUserLocation < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :location, "Rua do Conde de Redondo 91B"
  end
end
