class Adm::ItemsController < Adm::BaseController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :ecs, :racy_content]

  def index
    @search = Item.search(params[:q])
    @items = @search.result
                    .includes(:authors, :label, :categories)
                    .order(id: :desc)
                    .page(params[:page])
  end

  def edit
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to ({ action: :edit }), notice: 'Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to admin_items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ecs
    UpdateItemWorker.perform_async [@item.asin]
    redirect_to edit_admin_item_url(@item), notice: '更新Jobの追加が正常終了しました。'
  end

  def racy_content
    @item.update!(is_racy_content: !@item.is_racy_content)
  end

  def regist
    asin = params[:asin]
    UpdateItemWorker.perform_async [asin]
    redirect_to admin_items_url, notice: '登録Jobの追加が正常終了しました。'
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(
        :cute_count,
        :cool_count,
        :funny_count,
        :horror_count,
        :is_adult_content,
        :is_racy_content
      )
    end
end
