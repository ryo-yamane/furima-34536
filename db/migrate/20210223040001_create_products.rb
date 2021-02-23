class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name,      null: false
      t.text :product_explain,     null: false
      t.integer :price,             null: false
      t.integer :category_id,       null: false
      t.integer :condition_id,      null: false
      t.integer :consignor_area_id, null: false
      t.integer :deliver_fee_id,    null: false
      t.integer :prepare_date_id,   null: false
      t.references :user,              null: false,foreign_key:true      
      t.timestamps
    end
  end
end
