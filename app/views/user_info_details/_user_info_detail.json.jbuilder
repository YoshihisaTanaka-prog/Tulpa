json.extract! user_info_detail, :id, :text, :user_info_id, :category_id, :created_at, :updated_at
json.url user_info_detail_url(user_info_detail, format: :json)
