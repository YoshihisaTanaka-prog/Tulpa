class AngleCategory < ApplicationRecord

    def angles
        angle_ids = AngleAngleCategory.where(category_id: self.id).order(:name)
        ret = []
        angle_ids.each do |id|
            angle = Angle.find_by(id: id)
            unless angle.blank:
                ret.push({name: angle.name})
            end
        end
        return ret
    end

    def out
        return {name: self.name, angles: self.angles}
    end
end
