class CreateAngleAngleCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :angle_angle_categories do |t|
      t.integer :angle_id
      t.integer :category_id

      t.timestamps
    end
  end
end
