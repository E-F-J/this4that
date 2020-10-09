class AddMessageToRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :message, :text
  end
end
