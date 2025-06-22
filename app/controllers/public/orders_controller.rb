class Public::OrdersController < Public::BaseController
  def new
    @order = Order.new
  end

  def create
  end

  def index
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    case @order.address_option
    when "my_address"
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = "#{current_customer.last_name}#{current_customer.first_name}"
    when "registered_address"
      @order.shipping_postal_code = current_customer.addresses.find(params[:order][:registered_address_id]).postal_code
      @order.shipping_address = current_customer.addresses.find(params[:order][:registered_address_id]).address
      @order.shipping_name = current_customer.addresses.find(params[:order][:registered_address_id]).name
    when "new_address"
      @order.shipping_postal_code = params[:order][:new_postal_code]
      @order.shipping_address = params[:order][:new_address]
      @order.shipping_name = params[:order][:new_name]
    end

    @cart_items = current_customer.cart_items.includes(:item)
    @order.shipping_fee = 800
    @order.billing_amount = @cart_items.sum { |cart_item| cart_item.item.with_tax_price * cart_item.amount } + @order.shipping_fee

  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address_option, :registered_address_id, :new_postal_code, :new_address, :new_name)
  end
end
