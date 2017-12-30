class Adm::CategoriesController < Adm::BaseController
  before_action :set_category, only: [:edit, :update]

  def index
    @search = Category.search(params[:q])
    @categories = @search.result
  end

  def edit
    @items = @category.items.order(id: :desc).page(params[:page])
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to [:edit, :admin, @category], notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:hided)
    end
end
