class Usr::AuthorsController < Usr::BaseController
  def show
    @author = Author.find(params[:id])
  end
end
