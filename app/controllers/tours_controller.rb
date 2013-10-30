class ToursController < ApplicationController

  # before_filter :authenticate_user!
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  # GET /tours
  def index
    @tours = Tour.all
  end

  # GET /tours/1
  def show
  end

  # GET /tours/new
  def new
    @tour = Tour.new
    @amenities = Amenity.all
  end

  def edit
    @user = current_user
    @tour = Tour.where(tourist_id: @user.id).last

  end

  def create
    amenity = Amenity.find_by(id: tour_params[:amenities])
    @tour = Tour.new(
      start_date: tour_params[:start_date],
      end_date: tour_params[:end_date],
      questions: tour_params[:questions],
      tourist_id: current_user.id
      )
    if @tour.save
      @tour.tours_amenities.create(amenity_id: amenity.id)
      redirect_to @tour, notice: 'Tour was successfully created.'
      TourRequestMailer.tour_request_notifier(@tour).deliver
      TourConfirmationMailer.notifier(@tour).deliver
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /tours/1
  def update
    if @tour.update(tour_params)
      redirect_to @tour, notice: 'Tour was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /tours/1
  def destroy
    @tour.destroy
    redirect_to tours_url, notice: 'Tour was successfully destroyed.'
  end

  def rate
    @tour = Tour.find_by(id: params[:tour][:tour_id])
    if @tour.update_attributes(rating: params[:tour][:rating])
      redirect_to root_url, notice: "thanks for the feedback"
    else
      render action: 'edit'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tour_params
      params.require(:tour).permit(:start_date, :end_date, :questions, :amenities)
    end
end
