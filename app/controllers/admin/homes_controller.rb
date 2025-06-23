class Admin::HomesController < Admin::BaseController
  def top
    @orders = Order.all
  end
end
