class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  # 有効な会員のみログイン可能にする
  def active_for_authentication?
    super && membership_status?
  end

  def inactive_message
    membership_status? ? super : "このアカウントは退会済みです。"
  end
end
