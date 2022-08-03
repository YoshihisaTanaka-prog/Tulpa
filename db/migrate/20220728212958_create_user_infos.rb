class CreateUserInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :user_infos do |t|
      t.boolean :is_main
      t.boolean :is_need_meal
      t.boolean :is_need_sleep
      t.integer :user_id
      t.string :name
      t.boolean :is_shared, null: false, default: false

      t.timestamps
    end
  end
end
