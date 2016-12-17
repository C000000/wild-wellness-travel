class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_attachment :profile_picture

  def self.find_for_facebook_oauth(auth)
    user_params = auth.to_h.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def self.find_for_google_oauth2(oauth, signed_in_resource=nil)
  credentials = oauth.credentials
  data = oauth.info
  user = User.where(email: data["email"]).first


  # Uncomment the section below if you want users to be created if they don't exist
  unless user
   user = User.create(
      first_name: data["first_name"],
      last_name: data["last_name"],
      google_picture_url: data["image"],
      email: data["email"],
      password: Devise.friendly_token[0,20],
      token: credentials.token,
      refresh_token: credentials.refresh_token
   )
  end
  return user
end
end
