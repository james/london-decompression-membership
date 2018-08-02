class AddAccessToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :access, :string, default: 'none', null: false
  end
end
