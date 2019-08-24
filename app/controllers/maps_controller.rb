class MapsController < ApplicationController
  before_action :set_map, only: [:destroy]
  def index
    # @maps = Map.all
    @maps = current_user.maps
    @maps = Map.where.not(latitude: nil)
  end

  def new
    # 追記する
    @map = Map.new
  end

  def destroy
    @map.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:map).permit(:address, :latitude, :longitude)
    end
end