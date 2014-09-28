

class ProductTypesController < ApplicationController
  before_filter :load
#rescue ActiveRecord::RecordNotFound: :record_not_found
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def load
    @ptypes = ProductType.all
    @ptype = ProductType.new
    flash[:notice]= ""
  end
  def index
  end

  def new
     @ptype = ProductType.new
     @ptypes = ProductType.all
    # render :action => "index"
  end

  def create
    @ptype = ProductType.new(ptype_params)
    if @ptype.save
      @ptypes = ProductType.all

      #redirect_to product_types_url
    #direct_to product_types_url
    end
  end
  def edit
    @ptype = ProductType.find(params[:id])

    #render :action => "index"
  end

  def update

    @ptype.update(ptype_params)
    flash[:notice]="Updated successfully"
    @ptypes = ProductType.all
   # render :action => "index"
  end
  def show
    # @ptype = ProductType.find(params[:id])
    #
    # render :action => "index"
  end
  def destroy

    @ptype = ProductType.find(params[:id])
    @ptype.delete
    flash[:notice] = "successfully deleted"
    #render :action => "index"
    @ptypes = ProductType.all

  end


def record_not_found
  flash[:notice]= "Record not found"
  render :action => "index"
end


  def ptype_params
    params.require(:product_type).permit(:name)
  end
end

