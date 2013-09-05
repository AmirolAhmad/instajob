class AddFullNameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :first_name, :string
    add_column :members, :last_name, :string
    add_index :members, :first_name
    add_index :members, :last_name
  end
end
