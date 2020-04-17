class SharesController < ApplicationController

  before_action :set_share, only: [:show, :edit, :update,:earnings_per_shares, :destroy]

  def index
    @shares = Share.all
  end

  def show
    @eps = @share.earnings_per_shares.find_by(share_id: @share.id)
  end

  def new
    @share = current_user.shares.build
    @share.earnings_per_shares.build
  end

  def create
    @share = current_user.shares.build(share_params)
    respond_to do |format|
      if @share.save
        @share.set_earning_per_share
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

  def earnings_per_shares
    @earnings_per_shares = @share.earnings_per_shares.where(share_id: @share.id)
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

end
