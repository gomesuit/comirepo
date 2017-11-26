class Adm::LabelsController < Adm::BaseController
  before_action :set_label, only: [:show, :edit, :update, :destroy]

  # GET /adm/labels
  # GET /adm/labels.json
  def index
    @search = Label.search(params[:q])
    @labels = @search.result
                     .page(params[:page])
  end

  # GET /adm/labels/1
  # GET /adm/labels/1.json
  def show
  end

  # GET /adm/labels/new
  def new
    @label = Label.new
  end

  # GET /adm/labels/1/edit
  def edit
  end

  # POST /adm/labels
  # POST /adm/labels.json
  def create
    @label = Label.new(label_params)

    respond_to do |format|
      if @label.save
        format.html { redirect_to @label, notice: 'Label was successfully created.' }
        format.json { render :show, status: :created, location: @label }
      else
        format.html { render :new }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adm/labels/1
  # PATCH/PUT /adm/labels/1.json
  def update
    respond_to do |format|
      if @label.update(label_params)
        format.html { redirect_to edit_admin_label_url(@label), notice: 'Label was successfully updated.' }
        format.json { render :show, status: :ok, location: @label }
      else
        format.html { render :edit }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adm/labels/1
  # DELETE /adm/labels/1.json
  def destroy
    @label.destroy
    respond_to do |format|
      format.html { redirect_to admin_labels_url, notice: 'Label was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = Label.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def label_params
      params.require(:label).permit(:name)
    end
end
