class WeathersController < ApplicationController
  
  def seach

  end

  def show
    lat_id = params[:lat_id]
    lon_id = params[:lon_id]
    weather = URI.parse("http://api.openweathermap.org/data/2.5/weather?lat=#{lat_id}&lon=#{lon_id}&APPID=#{ENV['API_KEY']}")
    response = Net::HTTP.get(weather)
    weather_list = JSON.parse(response)
    tenki = weather_list["main"]
    @tenki = tenki
  end

end
