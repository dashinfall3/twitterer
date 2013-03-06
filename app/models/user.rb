
class User < ActiveRecord::Base

  has_many :tweets


  def fetch_tweets!
    tweets = Twitter.user_timeline(self.user_name)
    tweets.map {|tweet| Tweet.create(:content => tweet[:text], :tweeted_at => tweet[:created_at], :user_id => self.id)}
    self.sync_time = Time.now
  end

  def triangular_number(n)
    return 0 if n==0 
    n + triangular_number(n-1) 
  end

  def stale_threshold
    threshold = self.tweets.order("tweeted_at DESC").limit(10).inject(0){|memo, tweet| memo +(Time.now - tweet.tweeted_at)}/triangular_number(10)
    threshold > 2.hours ? 2.hours : threshold
  end

  def stale?
    Time.now - self.sync_time > stale_threshold
  end

end


