class AveragesController < ApplicationController
  def create
    @average = current_user.averages.create(weather_id: params[:weather_id])
    redirect_back(fallback_location: search_path)
  end

  def destroy
    @average = current_user.averages.find_by(weather_id: params[:weather_id])
    @average.destroy
    redirect_back(fallback_location: search_path)
  end
end
