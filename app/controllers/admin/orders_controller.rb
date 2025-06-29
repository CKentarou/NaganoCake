class Admin::OrdersController < Admin::BaseController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.includes(:item)
  end

  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      if order.order_status == "入金確認"
        order.order_details.update(production_status: "制作待ち")
      end
    end
    redirect_to admin_order_path(order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
