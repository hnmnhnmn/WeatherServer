class WeatherTodaysController < ApplicationController
    def show
        @weathers = WeatherToday.all
        @count = 0
        @weathers.each do |weather|
            @weather = weather
            if @weather.created_at.beginning_of_day >= Time.now.beginning_of_day && @weather.location == params[:location]
                @count += 1
                render "show", status: :ok
            end
        end
        if @count == 0
            render json: {Message: "can't find weather today"}, status: :ok
        end
    end

    def create
        @weathers = WeatherToday.all
        @count = 0
        @weathers.each do |weather|
            @weather = weather
            if @weather.created_at.beginning_of_day >= Time.now.beginning_of_day
                render json: {Message: "weather today have added"}, status: :ok
                @count += 1
            end
        end
        if @count == 0
            @weathertoday = WeatherToday.new(weather_today_params)
            if @weathertoday.save
                render json: {"message": "Add information weather today successed #{@count}"}, status: :ok
            else
                render json: @weathertoday.errors, status: :unprocessable_entity
            end
        end
    end

    private
    def weather_today_params
        params.require(:weather_today).permit(:location, :describe, :temperature, :humidity, :wind_direction)
    end
end
