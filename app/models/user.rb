class User < ApplicationRecord

    def out
        tulpas = TulpaUser.where(user_id: self.id).order(:created_at)
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
        tulpas.each do |tulpa|
            tulpa.our.each do |key, value|
                ret[key] = value
            end
        end
        return ret
    end
    
end
