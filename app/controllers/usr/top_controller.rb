class Usr::TopController < Usr::BaseController
  def index
    @items = Item.published.thisweek
                 .not_limited_freedoms
                 .order('RAND()')
                 .limit(10)

    @free_items = Item.published
                 .limited_freedoms
                 .order('RAND()')
                 .limit(10)
  end
end
