class UserController < ApplicationController
  $button_msg = 'Hello'
  def index
  end
  def button
    logger.info  "user"
    if params[:name]=='on_button'
      logger.info 'On button pressed'
      $button_msg = 'On button pressed'
    elsif params[:name]=='off_button'
      logger.info 'Off button pressed'
      $button_msg = 'Off button pressed'
    end
    redirect_to '/user/index'
  end
end
