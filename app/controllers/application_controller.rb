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
    @array_of_symbols = results_array.keys

    # pass first value to the html
    render({ :template => "conversion_template/forex.html.erb" })
  end

  def convert_first
    # change this to be from the api
    # pull first value and second to convert to
    # make two arrays
    # pass them to the html
    require "open-uri"
    require "json"

  end

  def covid
    render({ :template => "conversion_template/covid.html.erb" })
  end
end
