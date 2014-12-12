module Spree

  StockItem.class_eval do

    around_save :notify_availability

    private
    def notify_availability
      available = count_on_hand_was <= 0 && count_on_hand > 0 && count_on_hand_changed?

      yield

      if available
        variant.notify_waiting_list
      end
    end

  end

end