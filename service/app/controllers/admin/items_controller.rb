class Admin::ItemsController < Admin::BaseController
  def index
    # includesを使用してgenreを事前に読み込む(N+1問題対策)
    @items = Item.includes(:genre).all
  end

  def show
  end

  def new
    
  end

  def edit
  end

  def create
  end

  def update
  end
end
