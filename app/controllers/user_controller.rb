requi re 'pi_piper'

class UserController < ApplicationController
  $button_msg = 'Hello'
  $pin_led=PiPiper::Pin.new :pin => 4, :direction => :out
  def index
  end
  def button    
    #exp = open("/sys/class/gpio/export", "w")
    #exp.write(7)
    #exp.close
    
    
    #dir = open("/sys/class/gpio/gpio27/direction", "w")
    #dir.write("out")
    #dir.close
    
    logger.info  "user"
    if params[:name]=='on_button'
      #val = open("/sys/class/gpio/gpio27/value", "w")
      #val.write(1)
      #val.close
      $pin_led.on
      logger.info 'On button pressed'
      $button_msg = 'On button pressed'
    elsif params[:name]=='off_button'
      $pin_led.off
      logger.info 'Off button pressed'
      $button_msg = 'Off button pressed'
    end
    redirect_to '/user/index'
    #unexp = open('/sys/class/gpio/unexport',"w")
    #unexp.write(4)
    #unexp.close
    
  end
end
