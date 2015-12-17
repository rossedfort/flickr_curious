class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.nsid               = auth_info.extra.raw_info.person.nsid
      new_user.iconserver         = auth_info.extra.raw_info.person.iconserver
      new_user.iconfarm           = auth_info.extra.raw_info.person.iconfarm
      new_user.name               = auth_info.info.name
      new_user.user_name          = auth_info.info.nickname
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end
end
