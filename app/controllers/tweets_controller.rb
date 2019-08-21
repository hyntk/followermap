class TweetsController < ApplicationController
  before_action :twitter

  def index
    followers = twitter.followers
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
      map.save
    end
    redirect_to maps_url
    # @maps.save
  end

    def new
      @tessts = Tweet.new
    end

    def create
      Tweet.create
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
