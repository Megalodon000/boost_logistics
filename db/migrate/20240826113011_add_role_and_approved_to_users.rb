class AddRoleAndApprovedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :string
    add_column :users, :approved, :boolean
  end
end
