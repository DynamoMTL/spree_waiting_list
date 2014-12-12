module Spree

  StockItem.class_eval do

    around_save :notify_availability

    private
    def notify_availability
      available = count_on_hand_was <= 0 && count_on_hand > 0 && count_on_hand_changed?

      yield

      if available
        variant.stock_requests.notified(false).each &:notify!
        variant.product.stock_requests.without_variant.notified(false).each &:notify!
      end
    end

  end

end