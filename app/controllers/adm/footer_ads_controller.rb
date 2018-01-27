class Adm::FooterAdsController < Adm::BaseController
  before_action :set_footer_ad, only: [:edit, :update, :destroy]

  def index
    @footer_ads = FooterAd.all
  end

  def new
    @footer_ad = FooterAd.new
  end

  def edit
    render 'new'
  end

  def update
    @footer_ad.update!(ad_params)
    redirect_to action: :edit
  end

  def create
    FooterAd.create!(ad_params)
    redirect_to action: :index
  end

  def destroy
    @footer_ad.destroy
    redirect_to action: :index
  end

  private

    def set_footer_ad
      @footer_ad = FooterAd.find(params[:id])
    end

    def ad_params
      params.require(:footer_ad).permit(
        :name,
        :dom_pc,
        :dom_sp
      )
    end
end
