class AddCityToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :city, :string
  end
end
