class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :name
      t.string :description
      t.date :date_of_recording

      t.timestamps
    end
  end
end
