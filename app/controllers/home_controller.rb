class HomeController < ApplicationController
  before_action :twitter

  def index
    followers = twitter.followers
    # (current_user.name)
    # @followers.save!
    # redirect_to map_path

    # json = ActiveSupport::JSON.decode(followers)
    # json = JSON.parse(followers)
    followers.each do |data|
      p data[':name']
      @home = Home.new(
        name: data.name,
        location: data.location
      )
  
      # 確認
      if @tweet.save
        p 'DB保存に成功'
      else
        p 'DB保存に失敗'
      end
    end
  end

  private
    def twitter
      client = Twitter::REST::Client.new do |config|
        config.consumer_key =ENV['twitter_API_key']
        config.consumer_secret =ENV['twitter_API_secret_key']
        config.access_token =ENV['twitter_access_token']
        config.access_token_secret =ENV['twitter_access_token_secret']
      end
    end
end
