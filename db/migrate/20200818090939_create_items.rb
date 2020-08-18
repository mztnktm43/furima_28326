class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,              foreign_key: true
      t.string :name,                  null: false
      t.text :comment,                 null: false
      t.integer :cost,                 null: false
      t.integer :category_id,          null: false
      t.integer :product_status_id,    null: false
      t.integer :fee_id,               null: false
      t.integer :origin_prefecture_id, null: false
      t.integer :delivery_day_id,     null: false

      t.timestamps
    end
  end
end
