require 'google/cloud/firestore'

class ApisController < ApplicationController

    # https://n-srcoukfhwnkmi2hcs2nesuepjujifnywiaaqabi-0lu-script.googleusercontent.com/

    def test
        # 参照元↓
        # https://qiita.com/yuki0101/items/aa414de0d4a0d1d76869
        # https://googleapis-dev.translate.goog/ruby/google-cloud-firestore/latest/Google/Cloud/Firestore.html?_x_tr_sl=en&_x_tr_tl=ja&_x_tr_hl=ja&_x_tr_pto=wapp#new-class_method
        # https://tech.quartetcom.co.jp/2018/09/06/symfony-dotenv-values-including-newlines/

        credentials_hash = JSON.parse(ENV['GOOGLE_CLOUD_CREDENTIALS_JSON'])

        firestore = Google::Cloud::Firestore.new(project_id: credentials_hash["project_id"], credentials: credentials_hash)
        doc_ref = firestore.doc("USER/qs2OVnoz0iYpuTPfnuJv") # 読み込み先パスを指定
        document = doc_ref.get
        data = document.data.stringify_keys
        logger.debug data.keys
        data.keys.each do |key|
            user = User.find_by(mail_address: key)
            if user.nil?
                user = User.new()
                user.mail_address = key
                user.save
                logger.debug user.mail_address
            end
        end
        render plain: data
    end

    def top
        if params[:mail_address].blank? || params[:token]
            render json: {}            
            return
        end
        
        is_ok = false

        credentials_hash = JSON.parse(ENV['GOOGLE_CLOUD_CREDENTIALS_JSON'])
        firestore = Google::Cloud::Firestore.new(project_id: credentials_hash["project_id"], credentials: credentials_hash)
        doc_ref = firestore.doc("USER/qs2OVnoz0iYpuTPfnuJv") # 読み込み先パスを指定
        document = doc_ref.get
        data = document.data.stringify_keys
        logger.debug data.keys
        data.keys.each do |key, value|
            if key == params[:mail_address]
                if conditionvalue.token == params[:token]
                    is_ok = true
                end
                break
            end
        end

        user = User.find_by(mail_address: params[:mail_address])
        if user.blank?
            user = User.new()
            user.mail_address = params[:mail_address]
            user.save
        end
        
        if is_ok
            render json: user.out.to_json
        else
            render json: {}
        end
        
    end

    def dummy
        render json: {}
    end
    
    
end
