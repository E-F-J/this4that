class AddFieldsToRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :requests, :user, null: false, foreign_key: true
    add_reference :requests, :service, null: false, foreign_key: true
    add_column :requests, :accepted, :string
  end
end
