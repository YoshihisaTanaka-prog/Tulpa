class CreateTulpaUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :tulpa_users do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
