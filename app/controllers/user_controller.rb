#require 'pi_piper'
require 'serialport'
class UserController < ApplicationController
  $button_msg = 'Hello'
  $serial_msg = 'Serial device is (or maybe) ready'
  $serial_dev = '/dev/cu.usbmodem14111'
  #$pin_led=PiPiper::Pin.new :pin => 4, :direction => :out
  def index
    @user = User.new
  end
  def button
    logger.info  "method button"
    if params[:name]=='on_button'
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
    sp = SerialPort.new($serial_dev, 9600, 8, 1, 0) # 9600bps, 8bit, stopbit 1, parity none
    logger.info  "method serial"
    @user = params[:user]
    print @user[:data]
    sp.puts @user[:data] # write
    $serial_msg= @user[:data] << " was sent."

    redirect_to '/user/index'
  end

  def serial_dev
    logger.info "Method serial_dev"
    @user = params[:user]
    $serial_dev = @user[:data]
    redirect_to '/user/index'
  end
end
