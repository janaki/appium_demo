require_relative '../pages/home'
require_relative '../pages/signin'
require_relative '../pages/channel'
require_relative '../common/spec_helper'

#Test for Signing In
describe 'Home Screen Navigation' do
it 'Should Log In' do
  home.sign_in.click
  signin.enter_team_name.click
	signin.enter_email_address.click
  signin.enter_password.click
  signin.select_channel.click
end

end
