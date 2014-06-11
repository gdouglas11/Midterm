require_relative 'lib/city'
require_relative 'lib/weather_request'

puts 'Welcome to the Weather App!'

def create_city
  puts 'Enter a zip code to find out the weather.'
  zip = gets.chomp.to_i
  while zip <= 10000 || zip >= 99999
    puts 'Zip code is invalid.'
    puts 'Make sure your zipcode has 5 digits and is doesn\'t contain letters.'
    puts 'What is the zip code you\'re looking for?'
    zip = gets.chomp.to_i
  end
  City.new(zip)
end
  
city = create_city
puts 'The zip you\'re looking for is ' + city.zip_code.to_s + '.'
weather_request = Weather_request.new(city.zip_code)

if weather_request.error == false
  
#only execute lines 22 and 23 if there are no errors
puts "In #{city.zip_code.to_s}, it's #{weather_request.temperature} degrees fahrenheit and #{weather_request.climate}."
puts "I recommend wearing #{weather_request.recommended_clothing}."

end

