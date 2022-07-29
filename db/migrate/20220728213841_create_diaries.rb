class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.integer :user_info_id
      t.text :text

      t.timestamps
    end
  end
end
