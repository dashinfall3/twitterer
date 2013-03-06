class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text     :content
      t.string   :post_time
      t.integer  :user_id
      t.datetime :tweeted_at, :null => false
      t.timestamps
    end
  end
end
