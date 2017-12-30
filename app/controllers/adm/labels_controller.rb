class Adm::LabelsController < Adm::BaseController
  before_action :set_label, only: [:edit, :update]

  def index
    @search = Label.search(params[:q])
    @labels = @search.result
                     .page(params[:page])
  end

  def edit
    @items = @label.items.order(id: :desc).page(params[:page])
  end

  def update
    respond_to do |format|
      if @label.update(label_params)
        format.html { redirect_to edit_admin_label_url(@label), notice: 'Label was successfully updated.' }
        format.json { render :show, status: :ok, location: @label }
      else
        format.html { render :edit }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_label
      @label = Label.find(params[:id])
    end

    def label_params
      params.require(:label).permit(:name, :hided)
    end
end
