class ProductsController < ApplicationController
  def index
    @products = Product.all.joins(:category).select('products.id, products.name as name, products.price, products.description, categories.name as category, categories.id as category_id')
  end

  def show
    @product = Product.find(params[:id])
    @category = Product.find(params[:id]).category.name
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    Product.create(name:params['product']['name'], description:params['product']['description'], price:params['product']['price'], category_id:params['product']['category_id'])
    redirect_to '/products'
  end

  def update
    Product.find(params[:id]).update(name:params['product']['name'], description:params['product']['description'], price:params['product']['price'], category_id:params['product']['category_id'])
    redirect_to '/products'
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to '/products'
  end
end
