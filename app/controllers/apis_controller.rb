require 'google/cloud/firestore'

class ApisController < ApplicationController
    before_action :confirm_fb_token, only: [:top]

    def test
        ret = []
        tulpas = TulpaUser.all
        tulpas.each do |tulpa|
            ret.push tulpa.out
        end
        
        render plain: ret
    end

    def top
        categories = UserInfoCategory.all
        output_categories = []
        categories.each do |category|
            output_categories.push category.out
        end
        render json: {users: @user.out, token: @token, categories: output_categories}.to_json
    end

    def dummy
        render json: {}
    end
    
    
end
