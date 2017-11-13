class Usr::ItemsController < Usr::BaseController
  before_action only: [:yesterday, :today, :tomorrow, :thisweek, :nextweek] do
    @tab = action_name.to_sym
    @days = Item.send(action_name).category_filter.adult_filter.publication_dates
    render :index
  end

  # GET /items
  # GET /items.json
  def index
    @tab = :thisweek
    @days = Item.thisweek.category_filter.adult_filter.publication_dates
  end

  def yesterday; end
  def today; end
  def tomorrow; end
  def thisweek; end
  def nextweek; end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end
end
