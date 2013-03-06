class AddSyncColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sync_time, :datetime, :default => Time.now - 15.minutes
  end
end
