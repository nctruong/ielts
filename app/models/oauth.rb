class Oauth < ActiveRecord::Base
  def self.from_omniauth(auth)

    where(provider: auth.provider, uid: auth.uid).first_or_create do |oauth|
      oauth.provider = auth.provider
      oauth.uid = auth.uid
      oauth.name = auth.info.name
      oauth.oauth_token = auth.credentials.token
      oauth.oauth_expires_at = Time.at(auth.credentials.expires_at)

      oauth.save!
    end
  end
end
