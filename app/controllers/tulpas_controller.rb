require 'google/cloud/firestore'

class TulpasController < ApplicationController
    before_action :confirm_fb_token, only: [:top, :detail]

    def test
        ret = []
        tulpas = TulpaUser.all
        tulpas.each do |tulpa|
            ret.push tulpa.out
        end
        
        render plain: ret
    end

    def main
        categories = {}
        UserInfoCategory.all.order(:id).each do |category|
            category.out.each do |key, value|
                categories[key] = value
            end
        end
        angle_categories = {}
        AngleCategory.all.order(:id).each do |ac|
            angle_categories[ac.id] = ac.out
        end
        render json: {users: @user.out, token: @token, categories: categories, angle_categories: angle_categories}.to_json
    end

    def detail
        if @user.user_ids.include?( params[:user_info_id] )
            images = Image.where(user_info_id: params[:user_info_id]).order(:id)
            output_images = {}
            images.each do |image|
                output_images[image.id] = image.image
            end
            
            diaries = Diary.where(user_info_id: params[:user_info_id]).order(:id)
            output_diaries = {}
            diaries.each do |diary|
                output_diaries[diary.id] = {text: diary.text, created: diary.created_at}
            end
            render json: {images: output_images, diaries: output_diaries}
        else
            render json: {}
        end
    end

    def dummy
        render json: {}
    end
    
    
end
