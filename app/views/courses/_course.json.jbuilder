json.extract! course, :id, :subject, :number, :credit, :title, :description, :time, :days, :room, :instructor, :created_at, :updated_at
json.url course_url(course, format: :json)
