require 'rails_helper'

RSpec.describe ProductsForm do
  let(:shop_ids) { [''] + Shop.pluck(:id) }
  let(:params) { { shop_ids: shop_ids, table_columns: ['', 'shop_name', 'city', 'product_name']} }
  let(:form) { described_class.new(params) }

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

  describe '#records' do
    subject { form.records }

    it { expect(subject.size).to eq(5) }
  end

  describe '#selected_shops' do
    subject { form.selected_shops }

    it { is_expected.to eq([[Shop.first.name, Shop.first.id], [Shop.last.name, Shop.last.id]]) }
  end

  describe '#selected_sortable_columns' do
    subject { form.selected_sortable_columns }

    it { is_expected.to eq [['Name (Shop)', 'shop_name'], ['City (Shop)', 'city'], ['Name (Product)', 'product_name']] }
  end

  describe '#table_header_columns' do
    subject { form.table_header_columns }

    it { is_expected.to eq ['Shop name', 'City', 'Product name'] }
  end
end