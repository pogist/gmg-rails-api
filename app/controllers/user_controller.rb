class UserController < ApplicationController
  def show
    @user = User.find_by_id params[:id]
    render json: Oj.dump(@user, mode: :compat, indent: 2)
  end
end
