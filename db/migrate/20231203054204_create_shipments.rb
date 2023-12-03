class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|

      t.string :address,                  null: false
      t.integer :prefecture_id,           null: false
      t.string :ctiy,                     null: false
      t.string :street_num,               null: false
      t.string :building,                 null: false
      t.string :phone,                    null: false
      t.string :buy,                      null: false,foreign_key: true
      
      t.timestamps
    end
  end
end
