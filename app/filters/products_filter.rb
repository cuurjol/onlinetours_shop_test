class ProductsFilter
  SELECTED_SQL_COLUMNS = { shop_name: 'shops.name as shop_name', address: 'shops.address', metro: 'shops.metro',
                           city: 'shops.city', vendor_code: 'products.vendor_code', weight: 'products.weight',
                           size: 'products.size', color: 'products.color', price: 'products.price',
                           product_name: 'products.name as product_name', amount: 'product_shops.amount' }.freeze

  private_constant :SELECTED_SQL_COLUMNS

  attr_reader :scope

  def initialize(scope = nil)
    @scope = scope.joins(product_shops: :shop) unless scope.nil?
  end

  def cities(values)
    @scope = @scope.where(shops: { id: values })
  end

  def selected_columns(columns_keys)
    @scope = @scope.select(columns_keys.map { |column| SELECTED_SQL_COLUMNS[column] })
  end

  def sortable_columns(columns_keys, direction)
    return @scope if columns_keys.blank? || direction.blank?

    @scope = direction == 'asc' ? @scope.order(columns_keys) : @scope.order(columns_keys).reverse_order
  end
end