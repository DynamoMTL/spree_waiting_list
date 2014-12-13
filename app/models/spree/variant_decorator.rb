module Spree

  Variant.class_eval do
    has_many :stock_requests

    def notify_waiting_list
      stock_requests.notified(false).each &:notify!
      product.notify_waiting_list
    end
  end

end
