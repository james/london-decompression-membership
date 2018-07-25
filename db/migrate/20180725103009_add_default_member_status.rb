class AddDefaultMemberStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :members, :membership_status, :string, default: "associate", null: false
  end
end
