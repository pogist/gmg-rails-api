class UserController < ApplicationController
  before_filter :parse_request, only: [:create, :login]
  skip_before_filter :verify_authenticity_token, only: [:create, :login]

  def show
    @user = User.find_by_id params[:id]
    render json: Oj.dump(@user, mode: :compat, indent: 2)
  end

  def login
    @user = User.find_by_email @json[:email]    
    
    if @user.nil?
      render json: Oj.dump(message: "incorrect email"), status: 401    
    elsif @user.authenticate(@json[:password])
      render json: Oj.dump(@user, mode: :compat, indent: 2)
    else
      render json: Oj.dump(message: "incorrect password"), status: 401
    end
  end

  def list
    render json: Oj.dump(User.all, mode: :compat, indent: 2)
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
