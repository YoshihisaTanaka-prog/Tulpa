class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :image
      t.integer :user_info_id
      t.integer :angle_id

      t.timestamps
    end
  end
end
