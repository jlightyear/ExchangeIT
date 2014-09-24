class WelcomeController < ApplicationController

	def index
    @products = Product.all
	end

  def show
    render "index", :layout => false
  end
end
