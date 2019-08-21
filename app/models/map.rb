class Map < ApplicationRecord
  after_validation :geocode, if: :followerlocation_changed?

  private
  def geocode
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.followerlocation.gsub(" ", "")+"&key=ENV['google_map_API_key']")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"] if response["results"].present?
    self.longitude = response["results"][0]["geometry"]["location"]["lng"] if response["results"].present?
  end
end
