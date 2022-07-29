class User < ApplicationRecord

    def out
        # tulpas = TulpaUser.where(user_id: self.id).order(:created_at)
        tulpas = []
        user_info = UserInfo.find_by(user_id: self.id, is_main: true)
        ret = [user_info.out]
        tulpas.each do |tulpa|
            ret +=[tulpa.out]
        end
        return ret
    end
    
end
