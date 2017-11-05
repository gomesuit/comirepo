class SampleController < ApplicationController
  def index
    @items = Item.all
  end
end
