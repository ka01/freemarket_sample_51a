  def facebook_mock
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      :provider => "facebook",
      :uid  => "mock_uid_1234",
      :info => {
        :name  => "Mock eguchi",
        :email => "mock@gmail.com"
      }
    })
  end
end
