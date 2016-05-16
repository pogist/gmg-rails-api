class UserController < ApplicationController
  before_filter :parse_request, only: [:create]
  skip_before_filter :verify_authenticity_token, only: :create

  def show
    @user = User.find_by_id params[:id]
    render json: Oj.dump(@user, mode: :compat, indent: 2)
  end

  def create
    @user = User.new
    @user.assign_attributes(@json)

    if @user.save
      render json: Oj.dump(@user, mode: :compat, indent: 2)
    else
      render json: Oj.dump(@user.errors.messages, mode: :compat, indent: 2)
    end
  end

  private
  def parse_request
    @json = Oj.load(request.body.read, symbol_keys: true)
  end
end
