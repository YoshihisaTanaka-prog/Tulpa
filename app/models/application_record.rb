class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def confirm_and_save user
    if user.user_ids.include?(self.user_info_id)
      return self.save
    else
      return
    end
  end

  def confirm_and_update params, user
    if user.user_ids.include?(self.user_info_id)
      return self.update(params)
    else
      return
    end
  end

end
