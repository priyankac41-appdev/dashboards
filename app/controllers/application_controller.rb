class ApplicationController < ActionController::Base
  def home
    render({ :template => "conversion_template/home.html.erb" })
  end

  def forex
    @array_of_numbers = Array.new
    
    5.times do
      another_number = rand(1...100)
      
      @array_of_numbers.push(another_number)
    end

    render({ :template => "conversion_template/forex.html.erb" })
  end
end
