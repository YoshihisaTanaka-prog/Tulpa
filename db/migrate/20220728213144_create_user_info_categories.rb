class CreateUserInfoCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :user_info_categories do |t|
      t.string :type_name

      t.timestamps
    end
  end
end
