class UserInfoCategory < ApplicationRecord

    def out
        return {id: self.id, type: self.type_name}
    end
end
