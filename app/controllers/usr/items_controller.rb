class Usr::ItemsController < Usr::BaseController
  before_action :set_item, only: [:show]

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
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end
end
