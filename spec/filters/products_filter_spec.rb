require 'rails_helper'

RSpec.describe ProductsFilter do
  let(:filter) { described_class.new(Product.all) }

  before(:all) do
    FactoryBot.create_list(:shop, 2)
    FactoryBot.create_list(:product, 3)
    FactoryBot.create(:product_shop, shop: Shop.first, product: Product.first)
    FactoryBot.create(:product_shop, shop: Shop.first, product: Product.second)
    FactoryBot.create(:product_shop, shop: Shop.second, product: Product.first)
    FactoryBot.create(:product_shop, shop: Shop.second, product: Product.second)
    FactoryBot.create(:product_shop, shop: Shop.second, product: Product.third)
  end

  after(:all) do
    Shop.destroy_all
    Product.destroy_all
  end

  describe '#shops' do
    subject { filter.shops(Shop.first.id) }

    it { expect(subject.size).to eq(2) }
  end

  describe '#selected_columns' do
    subject { filter.selected_columns(%i[product_name shop_name address vendor_code weight]) }

    it { expect(subject.first.attributes.keys).to eq(%w[id vendor_code weight product_name shop_name address]) }
  end

  describe '#sortable_columns' do
    subject { filter.sortable_columns(%i[vendor_code], 'asc') }

    it { is_expected.to eq(Product.joins(product_shops: :shop).order(vendor_code: :asc)) }
  end
end