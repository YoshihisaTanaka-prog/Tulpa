class UserInfo < ApplicationRecord

    def out
        details = {}
        UserInfoCategory.all.order(:id).each do |category|
            list = {}
            UserInfoDetail.where(user_info_id: self.id, category_id: category.id).each do |detail|
                list[detail.id.to_s] = detail.out
            end
            details[category.id.to_s] = {typeName: category.type_name, texts: list}
        end
        return {self.id.to_s => {name: self.name, isNeedSleep: self.is_need_sleep, isNeedMeal: self.is_need_meal, isMain: self.is_main, details: details}}
    end
    
end
