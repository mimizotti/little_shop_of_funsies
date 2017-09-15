class AddConditonToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :condition, :integer, default: 0
  end
end
