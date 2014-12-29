class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  #before_action :set_product, except: [:slim_index]

  layout 'admin'
  # GET /products
  # GET /products.json
  def index
    if params[:page].nil?
      params[:page] = 1
    end

    sort = 'id ASC'
    sort = case params['sort']
             when "title"  then "title"
             when "title_reverse"  then "title DESC"

             when "id"  then "id"
             when "id_reverse"  then "id DESC"

             when "is_visible"  then "is_visible"
             when "is_visible_reverse"  then "is_visible DESC"
           end

    @products = Product.paginate(:per_page => 5, :page => params[:page]).order(sort)

  end

  #show all the products in slim index
  def slim_index
    if params[:page].nil?
      params[:page] = 1
    end

    sort = 'id ASC'
    sort = case params['sort']
             when "title"  then "title"
             when "title_reverse"  then "title DESC"

             when "id"  then "id"
             when "id_reverse"  then "id DESC"

             when "is_visible"  then "is_visible"
             when "is_visible_reverse"  then "is_visible DESC"
           end

    @products = Product.paginate(:per_page => 5, :page => params[:page]).order(sort)
    render :layout => false
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :categories)
    end
end
