
class Tweet <ActiveRecord::Base

  belongs_to :user

  validates :content, :tweeted_at, :uniqueness => true


end
