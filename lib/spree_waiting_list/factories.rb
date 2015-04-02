FactoryGirl.define do

  factory :stock_request, class: Spree::StockRequest do
    variant { |s| s.association(:base_variant) }
    email 'test@home.org'
  end

end