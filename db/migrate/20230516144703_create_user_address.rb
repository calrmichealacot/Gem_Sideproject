class CreateUserAddress < ActiveRecord::Migration[7.0]
  def change
    create_table :user_addresses do |t|
      t.integer :genre
      t.string :name
      t.string :street_address
      t.references :phone_number
      t.string :remark
      t.boolean :is_default
      t.string :user_id
      t.references :region_id
      t.references :province_id
      t.references :city_id
      t.references :barangay_id
      t.timestamps
    end
  end
end
