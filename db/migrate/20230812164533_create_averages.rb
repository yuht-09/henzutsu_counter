class CreateAverages < ActiveRecord::Migration[6.0]
  def change
    create_table :averages do |t|
      t.integer :user_id
      t.integer :weather_id

      t.timestamps
    end
  end
end
