class Admin::TrackingsController < ApplicationController
  before_action :set_tracking, only: %i[show edit update destroy]

  def index
    @trackings = Tracking.all
  end

  def show
  end

  def new
    @tracking = Tracking.new
  end

  def create
    @tracking = Tracking.new(tracking_params)
    if @tracking.save
      redirect_to admin_tracking_path(@tracking), notice: 'Tracking was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tracking.update(tracking_params)
      redirect_to admin_tracking_path(@tracking), notice: 'Tracking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tracking.destroy
    redirect_to admin_trackings_url, notice: 'Tracking was successfully destroyed.'
  end

  private

  def set_tracking
    @tracking = Tracking.find(params[:id])
  end

  def tracking_params
    params.require(:tracking).permit(:status, :location, :notes, :booking_id)
  end
end
