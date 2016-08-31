class Identity < ActiveRecord::Base
  belongs_to :student
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  # self means we use identity instead @identity and Identity
  def self.find_for_oauth(auth)
    # facebook or google will return it's uid and provider. We use this information to check on database if it's existing.
    identity = find_by(provider: auth.provider, uid: auth.uid)
    # if uid is not existing, creating new record
    # if uid is existing, set this record to identity
    identity = create(uid: auth.uid, provider: auth.provider) if identity.nil?
    identity.accesstoken = auth.credentials.token
    identity.refreshtoken = auth.credentials.refresh_token
    identity.name = auth.info.name
    # identity.email = auth.info.email
    #if auth.provider == "facebook"
    #  identity.email = auth.extra.user_hash.email # omniauth["extra"]["user_hash"]["email"]
    #elsif auth.provide == "google_oauth2"
      identity.email = auth.info.email
    #end
    identity.nickname = auth.info.nickname
    identity.image = auth.info.image
    identity.phone = auth.info.phone
    identity.urls = (auth.info.urls || "").to_json
    identity.save
    identity
  end
end
