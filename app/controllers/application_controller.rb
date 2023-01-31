class ApplicationController < ActionController::Base
  def home
    render({ :template => "conversion_template/home.html.erb" })
  end

  def forex
    # change this to be from the api
    # pull first value
    @array_of_numbers = Array.new

    5.times do
      another_number = rand(1...100)
      
      @array_of_numbers.push(another_number)
    end

    # pass first value to the html
    render({ :template => "conversion_template/forex.html.erb" })
  end

  def convert_first
    # change this to be from the api
    # pull first value and second to convert to
    # make two arrays
    # pass them to the html

  end
end
