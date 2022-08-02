class UserInfoCategory < ApplicationRecord

    def out
        return {self.id.to_s => self.type_name}
    end
end
