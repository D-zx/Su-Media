json.extract! assign_task, :id, :title, :description, :deadline, :user_id, :created_at, :updated_at
json.url assign_task_url(assign_task, format: :json)
