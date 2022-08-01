class UserInfo < ApplicationRecord

    def out
        output_details = []
        UserInfoCategory.all.order(:id).each do |category|
            list = []
            UserInfoDetail.where(user_info_id: self.id, category_id: category.id).each do |detail|
                list.push detail.out
            end
            output_details.push({type: category.type_name, texts: list})
        end
        return {id: self.id, name: self.name, isNeedSleep: self.is_need_sleep, isNeedMeal: self.is_need_meal, details: output_details}
    end
    
end
