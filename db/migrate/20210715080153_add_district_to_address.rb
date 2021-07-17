class AddDistrictToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :district, :string
  end
end
