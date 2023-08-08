class WeathersController < ApplicationController
  
  def search

  end

  def show
    lat_id = params[:lat_id]
    lon_id = params[:lon_id]
    weathers = URI.parse("http://api.openweathermap.org/data/2.5/weather?lat=#{lat_id}&lon=#{lon_id}&APPID=#{ENV['API_KEY']}")
    response = Net::HTTP.get(weathers)
    weather_list = JSON.parse(response)
    weather = weather_list
    @name = weather["name"]
    @weather_main = weather["weather"][0]["main"]
    @pressure = weather["main"]["pressure"]
  end

end
