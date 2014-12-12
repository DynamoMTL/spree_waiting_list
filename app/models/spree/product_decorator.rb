Spree::Product.class_eval do
  has_many :stock_requests

  def notify_waiting_list
    stock_requests.without_variant.notified(false).each &:notify!
  end
end
