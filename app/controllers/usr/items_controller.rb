class Usr::ItemsController < Usr::BaseController
  # GET /items
  # GET /items.json
  def index
    @days = Item.where('publication_date >= ?', Date.today)
                .order(publication_date: :asc)
                .pluck('DISTINCT publication_date')
    #@days = Item.where(publication_date: Date.yesterday..Date.tomorrow)
    #            .order(publication_date: :asc)
    #            .pluck('DISTINCT publication_date')
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end
end
