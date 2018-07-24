class CreateMembershipCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :membership_codes do |t|
      t.string :code
      t.boolean :taken, default: false, null: false

      t.timestamps
    end
  end
end
