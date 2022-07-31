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
        render json: {users: @user.out.to_json, token: @token}
    end

    def dummy
        render json: {}
    end
    
    
end
