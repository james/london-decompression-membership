class AddPasswordToMembers < ActiveRecord::Migration[5.2]
  def change
    change_table :members do |t|
      t.string :encrypted_password, null: false, default: ""
      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
    end
  end
end
