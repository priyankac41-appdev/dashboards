class ApplicationController < ActionController::Base
  def home
    render({ :template => "conversion_template/home.html.erb" })
  end

  def forex
    # call the api
    require "open-uri"
    require "json"
    #api_url = "https://api.exchangerate.host/convert?from=#{first}&to=#{second}"
    
    # open the data
    api_url = "https://api.exchangerate.host/symbols"
    raw_api_data = URI.open(api_url).read
    parsed_api_data = JSON.parse(raw_api_data)

    # pull first value
    results_array = parsed_api_data.fetch("symbols")
    @array_of_numbers = results_array
    #@array_of_numbers = Array.new

    # 5.times do
    #   another_number = rand(1...100)
      
    #   @array_of_numbers.push(another_number)
    # end

    # results_array.length().times do
    #   @array_of_numbers.push(results_array)
    # end

    # pass first value to the html
    render({ :template => "conversion_template/forex.html.erb" })
  end

  def convert_first
    # change this to be from the api
    # pull first value and second to convert to
    # make two arrays
    # pass them to the html

  end

  def covid
    render({ :template => "conversion_template/covid.html.erb" })
  end
end
