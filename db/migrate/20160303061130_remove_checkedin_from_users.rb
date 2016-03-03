class RemoveCheckedinFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :checked_in, :integer
  end
end