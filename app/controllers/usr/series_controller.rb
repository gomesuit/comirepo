class Usr::SeriesController < Usr::BaseController
  def show
    @series = Series.find(params[:id])
  end
end
