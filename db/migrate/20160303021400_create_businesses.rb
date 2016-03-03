class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end