class User < ApplicationRecord

    def out
        # tulpas = TulpaUser.where(user_id: self.id).order(:created_at)
        tulpas = []
        user_info = UserInfo.find_by(user_id: self.id, is_main: true)
        if user_info.nil?
            user_info = UserInfo.new
            user_info.user_id = self.id
            user_info.is_main = true
            user_info.is_need_meal = true
            user_info.is_need_sleep = true
            user_info.save
        end
        ret = [user_info.out]
        tulpas.each do |tulpa|
            ret +=[tulpa.out]
        end
        return {mailAddress: self.mail_address, users: ret}
    end
    
end
