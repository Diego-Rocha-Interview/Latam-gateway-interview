class AddPassToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :password, :string
  end
end
