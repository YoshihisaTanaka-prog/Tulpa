json.extract! user_info, :id, :is_main, :is_need_meal, :is_need_sleep, :user_id, :name, :created_at, :updated_at
json.url user_info_url(user_info, format: :json)
