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
        categories = UserInfoCategory.all
        output_categories = {}
        categories.each do |category|
            category.out.each do |key, value|
                output_categories[key] = value
            end
        end
        render json: {users: @user.out, token: @token, categories: output_categories}.to_json
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
