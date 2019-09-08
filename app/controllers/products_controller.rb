class ProductsController < ApplicationController
  def index
    @products_form = ProductsForm.new(products_form_params)

    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  private

  def products_form_params
    params.permit(products_form: {})[:products_form]
  end
end
