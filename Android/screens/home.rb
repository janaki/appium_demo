#home.rb
#Screen Object for the different tasks needed to run tests on the Home screen. Also used for tests requriing sign in step.
module Screen
  module Home
    class << self

      #Get the Sign in Button, then return the webdriver ID
      def sign_in
        @sign_in = wait { button('Sign In') }
        self
      end

      #Click on the Sign_In button, based on teh web id assigned.
      def click
        @sign_in.click
      end
    end
  end
end

module Kernel
  def home
    Screen::Home
  end
end