Spree::PermittedAttributes.class_eval do
  @@stock_request_attributes = [:email, :variant_id]
end

module Spree
  module PermittedAttributes
    class << self
      mattr_reader :stock_request_attributes

      ATTRIBUTES << :stock_request_attributes
    end
  end
end
