class Adm::ItemsController < Adm::BaseController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :ecs, :racy_content]

  # GET /items
  # GET /items.json
  def index
    @search = Item.search(params[:q])
    @items = @search.result
                    .includes(:authors, :label, :categories)
                    .order(id: :desc)
                    .page(params[:page])
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to edit_admin_item_url(@item), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
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
