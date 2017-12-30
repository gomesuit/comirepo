class Adm::SeriesController < Adm::BaseController
  def index
    @search = Series.search(params[:q])
    @series = @search.result
                     .page(params[:page])
  end

  def edit
    @series = Series.find(params[:id])
    @items = @series.items.order(id: :desc).page(params[:page])
  end
end
