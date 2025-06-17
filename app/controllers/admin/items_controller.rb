class Admin::ItemsController < Admin::BaseController
  def index
    # includesを使用してgenreを事前に読み込む(N+1問題対策)
    @items = Item.includes(:genre).all
  end

  def show
    @item = Item.includes(image_attachment: :blob).find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def update
  end
end

private
def item_params
  params.require(:item).permit(:name, :description, :price_excluding_tax, :sales_status, :genre_id, :image)
end