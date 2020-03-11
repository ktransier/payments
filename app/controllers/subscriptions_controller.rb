class SubscriptionsController < ApplicationController
  before_action :authenticate_session_user

  def new
  end
  
  def create
    current_user.card_token = user_params[:card_token]
    current_user.update(processor: 'stripe')
    current_user.subscribe
  end

  private

  def user_params
  	params.require(:user).permit(:card_token)
  end
end