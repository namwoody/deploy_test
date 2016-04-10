# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :developer unless Rails.env.production?
#   provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
#   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
# end



# Ensure our environment is bootstrapped with a facebook connect app
if ActiveRecord::Base.connection.table_exists? 'spree_authentication_methods'
  Spree::AuthenticationMethod.where(environment: Rails.env, provider: 'facebook').first_or_create do |auth_method|
    auth_method.api_key = '477157112445543'
    auth_method.api_secret = 'a54f73bc8fd9f4a2690172af32103a7e'
    auth_method.active = true
  end
end