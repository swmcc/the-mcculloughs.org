json.extract! video, :id, :name, :description, :date_of_recording, :created_at, :updated_at
json.url video_url(video, format: :json)
