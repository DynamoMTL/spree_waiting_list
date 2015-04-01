require 'spec_helper'

module Spree

  describe StockRequest do

    subject { create(:stock_request) }

    it { expect(subject).to be_valid }
    it { expect(subject.status).to eq('new') }

    it 'should validate email' do
      subject.email = 'garbage'
      subject.valid?

      expect(subject.errors[:email].size).to eq(1)
    end

    context 'notification' do

      before do
        mail = double(:mail)
        expect(UserMailer).to receive(:back_in_stock).with(subject).and_return(mail)
        expect(mail).to receive(:deliver)
        subject.notify!
      end

      it { expect(subject.status).to eql('notified') }
      it { expect(StockRequest.notified(false).size).to eq(0) }
      it { expect(StockRequest.notified(true).size).to eq(1) }
    end

  end

end

