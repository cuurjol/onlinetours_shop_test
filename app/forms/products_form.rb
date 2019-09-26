class ProductsForm
  include ActiveModel::Model

  SELECTIZE_OPTIONS = { shop_name: ['Name (Shop)', 'shop_name'], address: ['Address (Shop)', 'address'],
                        metro: ['Metro (Shop)', 'metro'], city: ['City (Shop)', 'city'],
                        vendor_code: ['Vendor code (Product)', 'vendor_code'],
                        product_name: ['Name (Product)', 'product_name'], weight: ['Weight (Product)', 'weight'],
                        size: ['Size (Product)', 'size'], color: ['Color (Product)', 'color'],
                        price: ['Price (Product)', 'price'], amount: ['Amount (ProductShop)', 'amount'] }.freeze

  TABLE_COLUMNS = { shop_name: 'Shop name', address: 'Address', metro: 'Metro', city: 'City',
                    vendor_code: 'Vendor code', product_name: 'Product name', weight: 'Weight',
                    size: 'Size', color: 'Color', price: 'Price', amount: 'Amount' }.freeze

  private_constant :SELECTIZE_OPTIONS, :TABLE_COLUMNS

  attr_accessor :shop_ids, :table_columns, :sortable_columns, :sort_direction

  def initialize(*arg)
    super

    rejected_params_ids_without_empty_values
  end

  def records
    return ProductsFilter.new.scope if shop_ids.blank? || table_columns.blank?

    @products_filter = ProductsFilter.new(Product.all)
    @products_filter.shops(shop_ids)
    @products_filter.selected_columns(table_columns)
    @products_filter.sortable_columns(sortable_columns, sort_direction)
  end

  def selected_shops
    Shop.all.map { |s| [s.name, s.id] }
  end

  def selected_table_columns
    SELECTIZE_OPTIONS.values
  end

  def selected_sortable_columns
    return [] unless table_columns.present?

    table_columns.map { |key| SELECTIZE_OPTIONS[key] }
  end

  def table_header_columns
    table_columns.map { |column| TABLE_COLUMNS[column] }
  end

  private

  def rejected_params_ids_without_empty_values
    shop_ids.reject!(&:blank?) if shop_ids.present?
    table_columns.reject!(&:blank?).map!(&:to_sym) if table_columns.present?
    sortable_columns.reject!(&:blank?).map!(&:to_sym) if sortable_columns.present?
  end
end