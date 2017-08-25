#Sign IN
#Screen Object for the different tasks needed to run tests on the Sign In screen. Also used for tests requriing sign in step.
module Screen
  module SignIn
    class << self

      #Get element of team name text field
      def enter_team_name
        find_element(:id, "com.Slack:id/edit_text").type "slack-coding-exercise.slack.com"
        @sign_in = wait { button('Continue') }
        self
      end

      #Get element of email address text field
      def enter_email_address
        wait { find_element(:id, "com.Slack:id/signin_secondary_text_top") }
        find_element(:id, "com.Slack:id/signin_secondary_text_top").type "theebasound+082016@gmail.com"
        @sign_in = wait { button('Continue') }
        self
      end

      #Get element of password text field
      def enter_password
        find_element(:id, "com.Slack:id/signin_edit_text").type "janaki"
        @sign_in = wait { button('Continue') }
        self
      end

      #Get element of channel and assign it to the sign_in variable
      def select_channel
        @sign_in = wait { text("general") }
        self
      end

      #Click on the current button assigned to @sign_in.
      def click
        @sign_in.click
      end
    end
  end
end

module Kernel
  def signin
    Screen::SignIn
  end
end