class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.page(params[:page]).per(6)
    if(params.has_key?(:searchbox))
      @products = Product.search(params[:searchbox])
      @products = Kaminari.paginate_array(@products).page(params[:page]).per(6)
    end
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
    if current_user.id != @product.user_id
      redirect_to products_path, alert: 'You can\'t update this product'
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.new(product_params)

    respond_to do |format|
      if @product.save
        UserMailer.email_to_new_product(@product, current_user).deliver
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
      format.html { redirect_to my_products_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_email
    product = Product.find(params[:product_id])
    UserMailer.email_to_user_product(product, current_user).deliver
    redirect_to product, notice: 'The email was successfully send.'
  end

  def my_products
    @products = current_user.products
    @products = Kaminari.paginate_array(@products).page(params[:page]).per(10)
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :categoria, :image, :user_id)
    end
end
