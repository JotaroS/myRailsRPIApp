require 'pi_piper'

class UserController < ApplicationController
  $button_msg = 'Hello'
  $serial_msg = 'Serial device is (or maybe) ready'
  $pin_led=PiPiper::Pin.new :pin => 4, :direction => :out
  def index
    @user = User.new
  end
  def button
    logger.info  "method button"
    if params[:name]=='on_button'
      #val = open("/sys/class/gpio/gpio27/value", "w")
      #val.write(1)
      #val.close
      #$pin_led.on
      logger.info 'On button pressed'
      $button_msg = 'On button pressed'
    elsif params[:name]=='off_button'
      #$pin_led.off
      logger.info 'Off button pressed'
      $button_msg = 'Off button pressed'
    end
    redirect_to '/user/index'
  end
  def serial
    logger.info  "method serial"
    @user = params[:user]
    print @user[:data]
    $serial_msg= @user[:data] << " was sent."
    if @user[:data] == "1"
    end
    redirect_to '/user/index'
  end
end
