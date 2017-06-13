require 'httparty'

class Kele
  include HTTParty

  def initialize(email, password)
    options = { body: { email: email, password: password } }
    response = self.class.post(api_url("sessions"), options)
    raise "Invalid email or password" if response.code == 404
    @auth_token = response["auth_token"]
  end

  private

  def api_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end
