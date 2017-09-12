class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.float :price
      t.string :image
      t.references :category, foreign_key: true, index: true

      t.timestamps
    end
  end
end
