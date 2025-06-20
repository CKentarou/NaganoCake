class Public::CartItemsController < Public::BaseController
  def index
  end

  def update 
  end

  def destroy
  end

  def destroy_all
  end

  def create
    cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)
    if cart_item
      cart_item.update(amount: cart_item.amount + params[:cart_item][:amount].to_i)
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
    end
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
