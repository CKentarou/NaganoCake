class Item < ApplicationRecord
    belongs_to :genre
    has_many :cart_items, dependent: :destroy
    has_many :order_details, dependent: :destroy
  
    has_one_attached :image
  
    enum sales_status: { 販売中: true, 販売停止中: false }


    def get_image(size: nil)
        unless image.attached?
            file_path = Rails.root.join('app/assets/images/no_image.jpg')
            image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        size ? image.variant(resize: size).processed : image
    end

    def with_tax_price
        (price_excluding_tax * 1.1).floor
    end
end 