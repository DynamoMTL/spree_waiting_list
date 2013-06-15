Spree::Variant.class_eval do
  has_many :stock_requests

  around_save :notify_availability

private
  def notify_availability
    available = count_on_hand_was <= 0 && count_on_hand > 0 && count_on_hand_changed?

    yield
    
    if available
      stock_requests.notified(false).each &:notify!
      product.stock_requests.without_variant.notified(false).each &:notify!
    end
  end
end
