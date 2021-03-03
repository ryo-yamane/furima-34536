class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :post_code,            null:false
      t.integer :consignor_area_id,   null:false
      t.string :city_town,            null:false
      t.string :number,               null:false
      t.string :building_name
      t.string :phone_number,         null:false
      t.references :order,            null:false,foreign_key:true
      t.timestamps
    end
  end
end
