class AddTokenToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :token, :string, null:false
    add_index :addresses, :token
  end
end
