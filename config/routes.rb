Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", { :controller => "application", :action => "home" })
  get("/forex", { :controller => "application", :action => "forex" })
  # get("/:first_currency/", { :controller => "application", :action => "convert" })
  # get("/:first_currency/:second_currency", { :controller => "application", :action => "convert" })
end
