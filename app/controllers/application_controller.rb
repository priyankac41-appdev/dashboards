class ApplicationController < ActionController::Base
  def home
    render({ :template => "conversion_template/home.html.erb" })
  end

  def forex
    # call the api
    require "open-uri"
    require "json"
    
    # open the data
    api_url = "https://api.exchangerate.host/symbols"
    raw_api_data = URI.open(api_url).read
    parsed_api_data = JSON.parse(raw_api_data)

    # pull first value
    results_array = parsed_api_data.fetch("symbols")
    @array_of_symbols = results_array.keys
    render({ :template => "conversion_template/forex.html.erb" })
  end

  def convert_first
    require "open-uri"
    require "json"

    api_url = "https://api.exchangerate.host/symbols"
    raw_api_data = URI.open(api_url).read
    parsed_api_data = JSON.parse(raw_api_data)
    results_array = parsed_api_data.fetch("symbols")
    @array_of_symbols = results_array.keys
    @from_symbol = params.fetch("from_currency")
    render({ :template => "conversion_template/step_two.html.erb" })
  end

  def convert_first_to_second
    require "open-uri"
    require "json"

    # api_url = "https://api.exchangerate.host/symbols"
    # raw_api_data = URI.open(api_url).read
    # parsed_api_data = JSON.parse(raw_api_data)
    # results_array = parsed_api_data.fetch("symbols")
    # @array_of_symbols = results_array.keys

    @from_symbol = params.fetch("from_currency")
    @to_symbol = params.fetch("to_currency")

    api_url = "https://api.exchangerate.host/convert?from=#{@from_symbol}&to=#{@to_symbol}"
    raw_api_data = URI.open(api_url).read
    parsed_api_data = JSON.parse(raw_api_data)
    @conversion = parsed_api_data.fetch("info").fetch("rate")

    render({ :template => "conversion_template/step_three.html.erb" })
  end

  def covid
    render({ :template => "conversion_template/covid.html.erb" })
  end
end
