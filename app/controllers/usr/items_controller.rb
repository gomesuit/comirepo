class Usr::ItemsController < Usr::BaseController
  # GET /items
  # GET /items.json
  def index
    @tab = params[:tab]&.to_sym
    @days = Item

    case @tab
    when :yesterday then
      @days = @days.where(publication_date: Date.today - 1)
    when :today then
      @days = @days.where(publication_date: Date.today)
    when :tomorrow then
      @days = @days.where(publication_date: Date.today + 1)
    when :thisweek then
      @days = @days.where(publication_date: Date.today.beginning_of_week..Date.today.end_of_week)
    when :nextweek then
      @days = @days.where(publication_date: Date.today.next_week.beginning_of_week..Date.today.next_week.end_of_week)
    else
      @tab = :thisweek
      @days = @days.where(publication_date: Date.today.beginning_of_week..Date.today.end_of_week)
    end

    @days = @days.order(publication_date: :asc)
                 .pluck('DISTINCT publication_date')
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end
end
