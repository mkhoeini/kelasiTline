class MessagesController < ApplicationController

  def index
	  @our_names = { 1 => "Saeid", 2 => "Amir", 3 => "Sadegh" }
  	@messages = Messages.all
  end

  def create
    @message = Messages.new params[:user_params]
    @message.save
    # render json: @message
    redirect_to root_path
  end
end