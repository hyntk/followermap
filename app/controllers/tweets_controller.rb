class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :twitter

  def index
    if user_signed_in?
      #もし同じユーザー名のデータがある場合、紐づくフォロワーデータを全削除
      current_user.maps.delete_all if User.where(name: current_user.name).count >= 1

      followers = twitter.followers(current_user.name).take(20)
      # (current_user.name)
      # @followers.save!
      # redirect_to map_path

      # json = ActiveSupport::JSON.decode(followers)
      # json = JSON.parse(followers)
        # @maps = []

      followers.each do |data|
        map = Map.new(
          followername: data.name,
          followerlocation: data.location
        )
        # @maps << map
        map.user_id = current_user.id
        map.save
      end
      redirect_to maps_url
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
