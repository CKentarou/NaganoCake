class Public::HomesController < Public::BaseController
  def top
    @items = Item.includes(image_attachment: :blob).all.order(created_at: :desc).limit(4)
    @genres = Genre.all
  end

  def about

  end
end
