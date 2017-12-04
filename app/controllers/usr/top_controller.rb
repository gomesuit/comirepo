class Usr::TopController < Usr::BaseController
  def index
    @tab = :thisweek
    @days = Item.published.thisweek
                .not_limited_freedoms
                .publication_dates
  end
end
