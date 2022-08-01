class UserInfo < ApplicationRecord

    def out
        details = UserInfoDetail.where(user_info_id: self.id).order(:category_id)
        output_details = []
        details.each do |detail|
            output_details.push detail.out
        end
        return {id: self.id, name: self.name, isNeedSleep: self.is_need_sleep, isNeedMeal: self.is_need_meal, details: output_details}
    end
    
end
