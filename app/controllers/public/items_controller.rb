class Public::ItemsController < Public::BaseController
  skip_before_action :authenticate_customer!, only: [:index, :show]

  def index
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
end
