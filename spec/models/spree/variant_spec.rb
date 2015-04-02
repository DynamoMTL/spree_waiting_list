require 'spec_helper'

describe Spree::Variant do
  let(:variant) { create(:variant) }

  context 'with stock_request' do
    before(:each) do
      create(:stock_request, variant: variant)
    end

    it '#waiting_list' do
      expect(variant.waiting_list.count).to eq(1)
    end

    context '#notify_waiting_list' do
      it 'should notify the waiting list when some product get in the stock' do
        expect(variant.total_on_hand).to eq(0)
        expect(variant.waiting_list.count).to eq(1)

        stockItem = Spree::StockItem.find_by!(variant: variant)
        stockItem.adjust_count_on_hand(1)

        expect(variant.waiting_list.count).to eq(0)
      end
    end
  end
end
