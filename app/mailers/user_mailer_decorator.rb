UserMailer.class_eval do
  def back_in_stock(request)
    @request = request
    @product = request.product
    @variant = request.variant

    mail(:subject => "Hey! #{request.product.name} is back in stock",
         :from    => Spree::Config[:order_from],
         :to      => request.email)
  end
end
