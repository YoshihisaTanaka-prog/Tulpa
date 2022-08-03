class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :mail_address
      t.integer :last_user_info_id
      t.boolean :is_include_me, null: false, default: true

      t.timestamps
    end
  end
end
