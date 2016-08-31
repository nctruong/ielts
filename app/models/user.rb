class User < ActiveRecord::Base
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

=begin
  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end
=end

=begin
  def google_oauth2_client
    if !@google_oauth2_client
      @google_oauth2_client = Google::APIClient.new(:application_name => 'HappySeed App', :application_version => "1.0.0")
      @google_oauth2_client.authorization.update_token!({:access_token => google_oath2.accesstoken, :refresh_token => google_oauth2.refreshtoken})
    end
    @google_oauth2_client
  end
=end

end
