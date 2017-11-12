class Usr::ItemsController < Usr::BaseController
  # GET /items
  # GET /items.json
  def index
    @tab = params[:tab]&.to_sym
    @days = Item

    case @tab
    when :yesterday then
      @days = @days.yesterday
    when :today then
      @days = @days.today
    when :tomorrow then
      @days = @days.tomorrow
    when :thisweek then
      @days = @days.thisweek
    when :nextweek then
      @days = @days.nextweek
    else
      @tab = :thisweek
      @days = @days.thisweek
    end

    @days = @days.publication_dates
  end

  def today
    @tab = :today
    @days = Item.today.publication_dates
    render :index
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end
end
