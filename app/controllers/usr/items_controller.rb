class Usr::ItemsController < Usr::BaseController
  # GET /items
  # GET /items.json
  def index
    @days = Item

    case params['tab']
    when 'yesterday' then
    when 'today' then
      @days = @days.where(publication_date: Date.today)
    when 'tomorrow' then
    when 'thisweek' then
      @days = @days.where(publication_date: Date.today.beginning_of_week..Date.today.end_of_week)
    when 'nextweek' then
      @days = @days.where(publication_date: Date.today.next_week.beginning_of_week..Date.today.next_week.end_of_week)
    else
      @days = @days.where('publication_date >= ?', Date.today)
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
