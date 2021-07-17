class AddUserToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :email, :string
  end
end
