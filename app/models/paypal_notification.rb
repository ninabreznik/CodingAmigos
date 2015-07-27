class PaypalNotification < ActiveRecord::Base
belongs_to :order
serialize :params
after_save :mark_order_as_paid

private

  def mark_order_as_paid
    if self.status == "Completed"
      @order = Order.find_by_id(self.cart_id)
      @order.update_attributes(:paid => true)
      # @beta = User.find_by_id(@order.selected.user_id)
      # create_conversation(@beta)
    end
  end

  # def create_conversation(beta)
  #  current_user.send_message(beta, "Pozdrav, zanima me vaš projekt. Kako vam lahko pomagam?", "Vaš projekt na Sosed.biz")
  # end
end
