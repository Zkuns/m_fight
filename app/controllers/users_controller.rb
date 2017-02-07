class UsersController < ApplicationController
  def fight
    fight_record = current_user.fight(params[:id])
    render json: fight_record
  end

  def user_info
    render plain: 'test'
  end
end
