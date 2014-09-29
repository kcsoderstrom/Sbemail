require 'addressable/uri'
require 'rest-client'

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: "Homestar", email: "homsar@homestarrunner.com"} }
  )

end

create_user