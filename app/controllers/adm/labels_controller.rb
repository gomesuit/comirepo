class Adm::LabelsController < ApplicationController
  before_action :set_adm_label, only: [:show, :edit, :update, :destroy]

  # GET /adm/labels
  # GET /adm/labels.json
  def index
    @adm_labels = Adm::Label.all
  end

  # GET /adm/labels/1
  # GET /adm/labels/1.json
  def show
  end

  # GET /adm/labels/new
  def new
    @adm_label = Adm::Label.new
  end

  # GET /adm/labels/1/edit
  def edit
  end

  # POST /adm/labels
  # POST /adm/labels.json
  def create
    @adm_label = Adm::Label.new(adm_label_params)

    respond_to do |format|
      if @adm_label.save
        format.html { redirect_to @adm_label, notice: 'Label was successfully created.' }
        format.json { render :show, status: :created, location: @adm_label }
      else
        format.html { render :new }
        format.json { render json: @adm_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adm/labels/1
  # PATCH/PUT /adm/labels/1.json
  def update
    respond_to do |format|
      if @adm_label.update(adm_label_params)
        format.html { redirect_to @adm_label, notice: 'Label was successfully updated.' }
        format.json { render :show, status: :ok, location: @adm_label }
      else
        format.html { render :edit }
        format.json { render json: @adm_label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adm/labels/1
  # DELETE /adm/labels/1.json
  def destroy
    @adm_label.destroy
    respond_to do |format|
      format.html { redirect_to adm_labels_url, notice: 'Label was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adm_label
      @adm_label = Adm::Label.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adm_label_params
      params.fetch(:adm_label, {})
    end
end
