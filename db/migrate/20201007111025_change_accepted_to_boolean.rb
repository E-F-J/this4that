class ChangeAcceptedToBoolean < ActiveRecord::Migration[6.0]
  def change
    change_column :requests, :accepted, 'boolean USING CAST(accepted AS boolean)'
  end
end
