require 'google/cloud/firestore'

class ApisController < ApplicationController

    def test
        base_uri = 'https://yoshihi-server-tulpa.firebaseio.com/'
        # 参照元↓
        # https://googleapis-dev.translate.goog/ruby/google-cloud-firestore/latest/Google/Cloud/Firestore.html?_x_tr_sl=en&_x_tr_tl=ja&_x_tr_hl=ja&_x_tr_pto=wapp#new-class_method
        credentials_hash = {
            "type" => ENV["type"],
            "project_id" => ENV["project_id"],
            "private_key_id" => ENV["private_key_id"],
            "private_key" => ENV["private_key"],
            "client_email" => ENV["client_email"],
            "client_id" => ENV["client_id"],
            "auth_uri" => ENV["auth_uri"],
            "token_uri" => ENV["token_uri"],
            "auth_provider_x509_cert_url" => ENV["auth_provider_x509_cert_url"],
            "client_x509_cert_url" => ENV["client_x509_cert_url"]
        }

        # render plain: credentials_hash.to_json

        firestore = Google::Cloud::Firestore.new(project_id: ENV["project_id"], credentials: credentials_hash)
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
    
end
