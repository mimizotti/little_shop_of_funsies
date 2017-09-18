class AddAttachmentImageToOrders < ActiveRecord::Migration[5.1]
  def change
    change_table :orders do |t|
      t.attachment :image
    end
  end
end
