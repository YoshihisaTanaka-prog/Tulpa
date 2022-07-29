class UserInfoDetail < ApplicationRecord
    validates :category_id, numericality: {greater_than: 0}
end
