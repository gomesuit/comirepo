class Adm::AuthorsController < Adm::BaseController
  before_action :set_author, only: [:edit, :update]

  def index
    @search = Author.ransack(params[:q])
    @authors = @search.result.page(params[:page])
  end

  def edit
    @items = @author.items.order(id: :desc).page(params[:page])
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to edit_admin_author_url(@author), notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:hided)
    end
end
