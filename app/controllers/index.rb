get '/' do
  # puts Twitter.user_timeline
  erb :index
end

get '/:username' do
  puts params
  @user = User.find_by_user_name(params[:username])
  if @user.stale?
    erb :user_newtweets
  else
    @tweets = @user.tweets.order("tweeted_at DESC").limit(10)
    erb :user_show
  end
end

get '/:username/tweets' do
  @user = User.find_by_user_name(params[:username])
  @user.fetch_tweets!
  @tweets = @user.tweets.order("tweeted_at DESC").limit(10)
  erb :_response , layout => false , :locals => {:info => @tweets}
end

post '/:username/post' do
  content_type :json
  @user = User.find_by_user_name(params[:username])
  begin
    twitter = Twitter.update(params[:content]) 
    message = "Success baby!" 
    success = true
  rescue Twitter::Error => e
    puts "hey there this is the exception #{e}"
    message = e.wrapped_exception
    success = false
  end

  {:message => message, :success => success, :content => params[:content], :username => params[:username] }.to_json
end
