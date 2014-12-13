FactoryGirl.define do

  factory :stock_request, class: Spree::StockRequest do
    product
    variant {product.master}
    email 'test@home.org'
  end

end