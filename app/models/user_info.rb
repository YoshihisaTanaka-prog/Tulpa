class UserInfo < ApplicationRecord

    def out
        return {id: self.id, name: self.name, isNeedSleep: self.is_need_sleep, isNeedMeal: self.is_need_meal}
    end
    
end
