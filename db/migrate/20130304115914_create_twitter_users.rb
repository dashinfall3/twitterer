class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :user_name
      t.integer  :id

      t.timestamps
    end
  end
end
