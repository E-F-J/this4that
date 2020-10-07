class AddFieldsToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :description, :text
    add_column :services, :price, :integer
    add_column :services, :available, :boolean
    add_column :services, :start_date_and_time, :string
    add_column :services, :end_date_and_time, :string
  end
end
