class CreateUserInfoDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :user_info_details do |t|
      t.string :text
      t.integer :user_info_id
      t.integer :category_id

      t.timestamps
    end
  end
end
