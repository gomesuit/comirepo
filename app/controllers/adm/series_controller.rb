class Adm::SeriesController < Adm::BaseController
  before_action :set_series, only: [:edit, :update]

  def index
    @search = Series.search(params[:q])
    @series = @search.result
                     .page(params[:page])
  end

  def edit
    @items = @series.items.order(id: :desc).page(params[:page])
  end

  def update
    respond_to do |format|
      if @series.update(series_params)
        format.html { redirect_to ({ action: :edit }), notice: 'Author was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_series
      @series = Series.find(params[:id])
    end

    def series_params
      params.require(:series).permit(:hided)
    end
end
