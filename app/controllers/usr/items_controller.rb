class Usr::ItemsController < Usr::BaseController
  before_action only: [:yesterday, :today, :tomorrow, :thisweek, :nextweek] do
    @tab = action_name.to_sym
    @days = Item.published.send(action_name)
                .not_limited_freedoms
                .publication_dates
    render :index
  end

  # GET /items
  # GET /items.json
  def index
    @tab = :thisweek
    @days = Item.published.thisweek
                .not_limited_freedoms
                .publication_dates
  end

  def yesterday; end
  def today; end
  def tomorrow; end
  def thisweek; end
  def nextweek; end

  def free
    @tab = action_name.to_sym
    @days = Item.published
                .limited_freedoms
                .free_last_dates
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  def count
    @item = Item.find(params[:id])
    @type = params[:type]
    if %w[cute_count cool_count funny_count horror_count].include?(@type)
      @item.increment!(@type)
    else
      render_404
    end
  end
end
