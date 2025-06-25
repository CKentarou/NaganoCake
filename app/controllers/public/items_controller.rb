class Public::ItemsController < Public::BaseController
  skip_before_action :authenticate_customer!, only: [:index, :show]

  def index
    if params[:genre_id].present?
      @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).per(8)
    else
      @items = Item.page(params[:page]).per(8)
    end
    @genres = Genre.all
    @genre = Genre.find(params[:genre_id]) if params[:genre_id].present?
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
end
