class User < ApplicationRecord

    def user_ids
        users = UserInfo.where(user_id: self.id).order(:id)
        ret = []
        users.each do |u|
            ret.push u.id
        end
        return ret
    end

    def out
        user_info = UserInfo.find_by(user_id: self.id, is_main: true)
        if user_info.nil?
            user_info = UserInfo.new
            user_info.user_id = self.id
            user_info.is_main = true
            user_info.is_need_meal = true
            user_info.is_need_sleep = true
            user_info.save
        end
        ret = {}
        user_info.out.each do |key, value|
            ret[key] = value
        end
        UserInfo.where(user_id: self.id, is_main: false).order(:id).each do |tulpa|
            tulpa.out.each do |key, value|
                ret[key] = value
            end
        end
        return ret
    end
    
end
