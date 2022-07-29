json.extract! diary, :id, :user_info_id, :text, :created_at, :updated_at
json.url diary_url(diary, format: :json)
