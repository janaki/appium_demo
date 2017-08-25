require_relative '../screens/home'
require_relative '../screens/signin'
require_relative '../screens/channel'
require_relative '../common/spec_helper'

#Tests for creating starring and searching messages in a channel.
describe 'Channel' do
it 'Should Post a Message' do
  home.sign_in.click
  signin.enter_team_name.click
	signin.enter_email_address.click
  signin.enter_password.click
  signin.select_channel.click
  channel.send_message("testing starred message").click
  expect(text("testing starred message").displayed?).to eq(true)
end

it 'Should Star a Message' do
  home.sign_in.click
  signin.enter_team_name.click
  signin.enter_email_address.click
  signin.enter_password.click
  signin.select_channel.click
  channel.select_message
  channel.star_message
  expect(find_element(:id, "com.Slack:id/msg_star").displayed?).to eq(true)
end

it 'Should Search For a Message' do
  home.sign_in.click
  signin.enter_team_name.click
  signin.enter_email_address.click
  signin.enter_password.click
  signin.select_channel.click
  text = channel.search_message("has:star")
  wait{find_element(:id, "com.Slack:id/msg_text")}
  expect(find_element(:id, "com.Slack:id/msg_text").displayed?).to eq(true)
end

it 'Should Display No Results On Empty Search' do
  home.sign_in.click
  signin.enter_team_name.click
  signin.enter_email_address.click
  signin.enter_password.click
  signin.select_channel.click
  text = channel.search_message("has")
  wait{find_element(:id, "com.Slack:id/search_no_results")}
  expect(find_element(:id, "com.Slack:id/search_no_results").displayed?).to eq(true)
end

it 'Should Display Starred Items in Main Menu' do
  home.sign_in.click
  signin.enter_team_name.click
  signin.enter_email_address.click
  signin.enter_password.click
  signin.select_channel.click
  channel.search_message("has:star")
  channel.return_to_channel_view.click
  channel.return_to_main_menu.click
  channel.view_starred_messages.click
  wait{ find_element(:id, "com.Slack:id/msg_text") }
  expect(find_element(:id, "com.Slack:id/msg_text").displayed?).to eq(true)
end


end
