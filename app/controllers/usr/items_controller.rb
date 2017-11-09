class Usr::ItemsController < Usr::BaseController
  # GET /items
  # GET /items.json
  def index
    @days = Item.order(publication_date: :asc).pluck('DISTINCT publication_date')
    @items = Item.all.order(publication_date: :desc)

    if params[:test]
      render template: 'items/index2'
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end
end
