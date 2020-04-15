class SharesController < ApplicationController

  before_action :set_share, only: [:show, :edit, :update, :destroy]

  def index
    @shares = Share.all
  end

  def show

  end

  def new
    @share = current_user.shares.build
    @share.earnings_per_shares.build
  end

  def create
    @share = current_user.shares.build(share_params)
    respond_to do |format|
      if @share.save
        debugger
        @share.earnings_per_shares.new(earnings_per_share_params.merge(share_id: @share.id))
        @eps_value = @share.after_creation_scrape
        format.html { redirect_to @share, notice: 'Share was successfully created '}
        format.json {render :show, status: :created, location: @share}
      else
        format.html {render :new}
        format.json { render json: @share.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @share.update
        format.html { redirect_to @share, notice: 'Share was successfully created '}
        format.json {render :show, status: :created, location: @share}
      else
        format.html {render :new}
        format.json { render json: @share.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @share.destroy
    respond_to do |format|
      format.html {redirect_to shares_url, notice: 'Share was successfully destroyed'}
      format.json {head :no_content}
    end
  end

  private

  def set_share
    @share = Share.find(params[:id])
  end

  def share_params
    params.require(:share).permit(:share_name, :url, :price_to_earning)
  end

  def earnings_per_share_params
    params.permit(:value)
  end

end
