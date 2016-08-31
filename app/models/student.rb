class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, :omniauth_providers => [:google_oauth2,:facebook]

  has_many :identities

  # users/auth/:provider/facebook
  def facebook
    identities.where( :provider => "facebook").first
  end

  # users/auth/:provider/google_oauth2
  def google_oauth2
    identities.where( :provider => "google_oauth2" ).first
  end
end
