class User < ApplicationRecord
  has_many :maps, dependent: :delete_all
  has_many :blogs, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

         def self.find_for_oauth(auth)
          user = User.where(uid: auth.uid, provider: auth.provider).first
       
          unless user
            user = User.create(
              provider: auth.provider,
              uid:      auth.uid,
              name: auth.info.nickname,
              email:    User.dummy_email(auth),
              password: Devise.friendly_token[0, 20]
            )
          end
       
          user
        end
       
        private
       
      # ダミーのアドレスを用意
        def self.dummy_email(auth)
          "#{auth.uid}-#{auth.provider}@example.com"
        end

end
