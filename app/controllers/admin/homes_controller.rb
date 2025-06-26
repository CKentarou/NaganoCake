class Admin::HomesController < Admin::BaseController
  def top
    if params[:customer_id].present?
      @orders = Order.where(customer_id: params[:customer_id]).page(params[:page]).per(10)
    else
      @orders = Order.page(params[:page]).per(10)
    end
  end
end
