class TulpaUser < ApplicationRecord

    def out
        user_info = UserInfo.find_by(user_id: self.id, is_main: false)
        return user_info.out
    end
    
end
