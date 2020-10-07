class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.reference :service
      t.boolean :accepted

      t.timestamps
    end
  end
end
