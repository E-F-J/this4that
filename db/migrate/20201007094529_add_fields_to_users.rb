class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :personal_description, :text
    add_column :users, :expertise, :string
    add_column :users, :points_accumulated, :integer
    add_column :users, :availability, :boolean
    add_column :users, :address, :string
  end
end
