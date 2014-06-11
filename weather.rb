require 'rubygems' #load the rubygems
require 'rest-client'
require 'pry'
require 'json'

    zip = 94107
    key = '625e2ec179a8cd6474ed819543ad543efbaf7cff'
    response = JSON.load(RestClient.get("http://api.worldweatheronline.com/free/v1/weather.ashx?key=#{key}&q=#{zip}&num_of_days=1&format=JSON"))
    puts response


