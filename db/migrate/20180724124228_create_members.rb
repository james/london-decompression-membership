class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :membership_status
      t.string :membership_number

      t.timestamps
    end
  end
end
