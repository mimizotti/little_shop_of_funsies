class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :item, foreign_key: true, index: true
      t.references :order, foreign_key: true, index: true

      t.timestamps
    end
  end
end
