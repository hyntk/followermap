class HomeController < ApplicationController
  before_action :twitter

  def index
    @followers = twitter.followers
    # (current_user.name)
    binding.pry
    # @followers.save!
    # redirect_to map_path
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
