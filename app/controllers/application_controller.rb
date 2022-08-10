class ApplicationController < ActionController::Base
    skip_forgery_protection

    def confirm_fb_token
        if params[:mail_address].blank? || params[:gcf_token].blank?
            render json: {}
        end

        # 参照元↓
        # https://zenn.dev/mochiblock/articles/96b6762011b6f9
        # https://googleapis-dev.translate.goog/ruby/google-cloud-firestore/latest/Google/Cloud/Firestore.html?_x_tr_sl=en&_x_tr_tl=ja&_x_tr_hl=ja&_x_tr_pto=wapp#new-class_method
        # https://tech.quartetcom.co.jp/2018/09/06/symfony-dotenv-values-including-newlines/

        credentials_hash = JSON.parse(ENV['GOOGLE_CLOUD_CREDENTIALS_JSON'])
        firestore = Google::Cloud::Firestore.new(project_id: credentials_hash["project_id"], credentials: credentials_hash)
        doc_ref = firestore.doc("USER/qs2OVnoz0iYpuTPfnuJv") # 読み込み先パスを指定

        data = doc_ref.get.data.stringify_keys
        logger.debug [data[params[:mail_address]], params[:gcf_token]]


        if data[params[:mail_address]][:token] == params[:gcf_token]

            @user = User.find_by(mail_address: params[:mail_address])
            if @user.blank?
                @user = User.new()
                @user.mail_address = params[:mail_address]
                @user.save
            end

            @token = ""
            for num in 1..50 do
                r = rand 62
                c = ""
                if r < 10
                    c = (r + 48).chr
                elsif r < 36
                    c = (r + 55).chr
                else
                    c = (r + 61).chr
                end
                @token = @token + c
            end

            # doc_ref.set({params[:mail_address] => {token: @token, accessedAt: Time.now}})
        else
            render json: {}
        end
    end

end
