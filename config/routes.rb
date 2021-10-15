Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :api, defaults: { format: :json } do
    root "weather_todays#show"
    post "/WeatherToday", to: "weather_todays#create"
  end
end
