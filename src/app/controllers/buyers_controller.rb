class BuyersController < ApplicationController
  def index
    @buyers = Buyer.all
  end

  def show
    @buyer = Buyer.find(params[:id])
  end

  def new
  end

  def create
    @buyer = Buyer.new(params[:buyer])
   
    @buyer.save
    redirect_to @buyer
  end

private
  def buyer_params
    params.require(:buyer).permit(:name, :key)
  end
end
