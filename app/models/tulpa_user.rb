class TulpaUser < ApplicationRecord

    def out
        user_info = UserInfo.find_by(user_id: self.id, is_main: false)
        if user_info.nil?
            user_info = UserInfo.new
            user_info.user_id = self.id
            user_info.is_main = false
            user_info.save
        end
        return user_info.out
    end
    
end
