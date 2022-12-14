class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def confirm_and_save params, user
    if user.user_ids.include?(params["user_info_id"])
      return self.save
    else
      return
    end
  end

  def confirm_and_update params, user
    params["user_info_id"] = self.user_info_id
    return self.update(params)
  end

end
