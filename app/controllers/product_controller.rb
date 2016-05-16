class ProductController < ApplicationController
  before_filter :parse_request, only: [:create]
  skip_before_filter :verify_authenticity_token, only: :create

  def show
    @product = Product.find_by_id params[:id]
    render json: Oj.dump(@product, mode: :compat, indent: 2)
  end

  def search
    result = Product.where('name LIKE ? AND platform in (?)', "%#{params[:name]}%", params[:platforms].split(/,\s?/))
    render json: Oj.dump(result, mode: :compat, indent: 2)
  end

  def list
    render json: Oj.dump(Product.all, mode: :compat, indent: 2)
  end

  def create
    @user = User.find_by_id params[:user_id]
    @json[:location] = @user.location

    @product = @user.products.new
    @product.assign_attributes(@json)

    if @product.save
      render json: Oj.dump(@product, mode: :compat, indent: 2)
    else
      render json: Oj.dump(@product.errors.messages, mode: :compat, indent: 2)
    end
  end

  private
  def parse_request
    @json = Oj.load(request.body.read, symbol_keys: true)
  end
end
