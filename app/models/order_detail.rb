class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item

    after_update :update_order_status_if_in_production
    after_update :update_order_status_if_all_production_complete
  
    enum production_status: { 着手不可: 0, 制作待ち: 1, 製作中: 2, 制作完了: 3 }

    private

    def update_order_status_if_in_production
        if order.order_details.where(production_status: "製作中").exists?
            order.update(order_status: "製作中")
        end
    end

    def update_order_status_if_all_production_complete
        if order.order_details.where(production_status: "制作完了").count == order.order_details.count
            order.update(order_status: "発送準備中")
        end
    end
end