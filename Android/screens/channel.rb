#channel.rb
#Screen Object for the different tasks needed to run tests on the Channel screen.
module Screen
  module Channel
    class << self

      #Find the element for the message text field, and enter a custom message.
      def send_message(message)
        find_element(:id, "com.Slack:id/message_input_field").clear
        find_element(:id, "com.Slack:id/message_input_field").type message
        @button = find_element(:id, "com.Slack:id/message_send_btn")
        self
      end

      #Return to Channel view from search - used after testing search functionality.
      #Find the element by xpath - we use xpath as the link to return to the channel view is anchored to an image, which
      # is currentyl not supported with appium.
      def return_to_channel_view
        @button = wait{find_element(:xpath, "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/
                                            android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/
                                            android.widget.LinearLayout[1]/android.view.ViewGroup[1]/
                                            android.widget.ImageButton[1]") }
        self
      end

      #Return to the main menu, after the channel view. we use xpath as the link to return to the channel view is anchored to an image, which
      # is currentyl not supported with appium.
      def return_to_main_menu
        @button = wait{find_element(:xpath, "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/
                                             android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/
                                             android.widget.LinearLayout[1]/android.view.ViewGroup[1]/
                                             android.widget.LinearLayout[1]/android.widget.RelativeLayout[1]/
                                             android.widget.ImageButton[1]") }
        self
      end

      #View list of starred messages we use xpath as the link to return to the channel view is anchored to an image, which
      # is currentyl not supported with appium.
      def view_starred_messages
        @button = wait{find_element(:xpath, "//android.widget.LinearLayout[1]/android.widget.FrameLayout[1]/
                                             android.widget.FrameLayout[1]/android.widget.FrameLayout[1]/
                                             android.widget.FrameLayout[1]/android.widget.LinearLayout[1]/
                                             android.widget.HorizontalScrollView[1]/android.widget.LinearLayout[1]/
                                             android.widget.TextView[4]") }
       self
      end

      #We abstract the button class variable to be used in different fuctions throughout the screen.
      def click
        @button.click
      end

      #Select Message to perform actions like starring or editing. We use the Appium Touch Action library, and
      #pass in coordiantes.
      def select_message
        wait{find_element(:id, "com.Slack:id/msg_text")}
        Appium::TouchAction.new.press(x: 288, y: 2213).wait(2000).release.perform
      end

      #Star the selected message.  We use the Appium Touch Action library, and
      #pass in coordiantes.
      def star_message
        Appium::TouchAction.new.press(x: 288, y: 2113).wait(2000).release.perform
      end

      #Search a message: click on the magnifying class, then enter the message to search for. We use the Appium Touch Action library, and
      #pass in coordiantes.
      def search_message(message)
        wait{find_element(:id, "com.Slack:id/action_search")}
        find_element(:id, "com.Slack:id/action_search").click
        find_element(:id, "com.Slack:id/actionbar_search").type message
        Appium::TouchAction.new.tap(x: 1328, y: 2394).release.perform
      end
    end
  end
end

module Kernel
  def channel
    Screen::Channel
  end
end