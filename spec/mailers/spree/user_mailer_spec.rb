require 'spec_helper'

module Spree

  describe UserMailer do

    USER_EMAIL = 'admin@mysite.com'

    let(:request) { create(:stock_request) }

    before do
      Spree.config {|config| config.mails_from = USER_EMAIL }
    end

    it 'back in stock' do

      @mail = UserMailer.back_in_stock(request)

      expect(@mail.subject).to eql(Spree.t(:back_in_stock_subject, product_name: request.product.name))
      expect(@mail.to).to include(request.email)
      expect(@mail.from).to include(USER_EMAIL)

    end

  end
end
