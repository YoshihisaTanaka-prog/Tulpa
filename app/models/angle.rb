class Angle < ApplicationRecord

    def set_categories category_list
        unselected_category_list = []
        AngleCategory.all.each do |ac|
            unless category_list.include?(ac.id.to_s)
                unselected_category_list.push(ac.id.to_s)
            end
        end
        
        category_list.each do |category|
            aac = AngleAngleCategory.find_by(category_id: category, angle_id: self.id)
            if aac.blank?
                aac = AngleAngleCategory.new
                aac.category_id = category.to_i
                aac.angle_id = self.id
                aac.is_enabled = true
                aac.save
            elsif aac.is_enabled = false
                aac.is_enabled = true
                aac.save
            end
        end
        
        unselected_category_list.each do |category|
            aac = AngleAngleCategory.find_by(category_id: category, angle_id: self.id)
            unless aac.blank?
                aas.is_enabled = false
                aac.save
            end
        end
    end

end
