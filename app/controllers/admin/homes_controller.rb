class Admin::HomesController < Admin::BaseController
  def top
    @orders = Order.page(params[:page]).per(10)
  end
end
