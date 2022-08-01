class UserInfoDetail < ApplicationRecord
    validates :category_id, numericality: {greater_than: 0}

    def out
        return {id: self.id, text: self.text}
    end
end
