json.extract! student_attendance, :id, :schedule_id, :user_id, :created_at, :updated_at
json.url student_attendance_url(student_attendance, format: :json)
