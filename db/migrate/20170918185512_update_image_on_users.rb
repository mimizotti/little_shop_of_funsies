class UpdateImageOnUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :image, :attachments
  end
end
