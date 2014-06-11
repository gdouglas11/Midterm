require 'rubygems' #load the rubygems
require 'rest-client'
require 'pry'
require 'json'

class Weather_request
  attr_accessor :temperature, :zip_code, :climate, :error
  
  def initialize(zip)
    @zip_code = zip
    key = '625e2ec179a8cd6474ed819543ad543efbaf7cff'
    response = JSON.load(RestClient.get("http://api.worldweatheronline.com/free/v1/weather.ashx?key=#{key}&q=#{zip}&num_of_days=1&format=JSON"))
    if !response["data"]["error"]
      @temperature = response["data"]["current_condition"][0]["temp_F"]
      @climate = response["data"]["current_condition"][0]["weatherDesc"][0]["value"]
      @error = false
    else 
      puts 'That zip does not exist, sorry, goodbye.'
      @error = true
    end
    
  end
  
  def recommended_clothing
    if @temperature.to_i >= 70 
      "some shorts"
    else
      "a jacket"  
    end
  end
end
