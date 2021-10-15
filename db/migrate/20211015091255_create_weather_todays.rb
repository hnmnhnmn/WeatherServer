class CreateWeatherTodays < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_todays do |t|
      t.string :describe
      t.string :temperature
      t.string :humidity
      t.string :wind_direction

      t.timestamps
    end
  end
end
