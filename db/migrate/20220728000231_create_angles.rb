class CreateAngles < ActiveRecord::Migration[7.0]
  def change
    create_table :angles do |t|
      t.string :name

      t.timestamps
    end
  end
end
