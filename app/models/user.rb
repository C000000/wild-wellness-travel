class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_one :company

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  # Attachinary
  has_attachment :profile_picture

  # Geocode
  geocoded_by :full_address
  after_validation :geocode, if: :full_address_changed?


  # Facebook Auth
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

  # Google Auth
  def self.find_for_google_oauth2(oauth, signed_in_resource=nil)
  credentials = oauth.credentials
  data = oauth.info
  user = User.where(email: data["email"]).first

  # Uncomment the section below if you want users to be created if they don't exist
  unless user
   user = User.create(
      first_name: data["first_name"],
      last_name: data["last_name"],
      facebook_picture_url: data["image"],
      email: data["email"],
      password: Devise.friendly_token[0,20],
      token: credentials.token,
      token_expiry: credentials.refresh_token
   )
  end
  return user
end

  # Geocoder autocomplete
  def full_address
    "#{street_address}, #{zip_code} #{city} #{state} #{ISO3166::Country[country].name}"
  end

  def full_address_changed?
    street_address_changed? || zip_code_changed? || city_changed? || state_changed? || country_changed?
  end

  # Collections
  GENDER = ["Female", "Male", "Other"]
  STATES = ['Alabama', 'Alaska', 'Arizona', 'Arkansas',
            'California', 'Colorado', 'Connecticut', 'Delaware',
            'District of Columbia', 'Florida', 'Georgia', 'Hawaii',
            'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas',
            'Kentucky', 'Louisiana', 'Maine', 'Maryland',
            'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi',
            'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
            'New Jersey', 'New Mexico', 'New York', 'North Carolina',
            'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania',
            'Puerto Rico', 'Rhode Island', 'South Carolina', 'South Dakota',
            'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington',
            'West Virginia', 'Wisconsin', 'Wyoming']
end
