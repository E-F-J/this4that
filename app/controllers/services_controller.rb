class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  def index
    @service = Service.all
  end

  def show
  end

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    authorize @service

    if @service.save
      redirect_to @service, notice: 'Great! Ready to share your service!'
    else
      render :new
    end
  end

  def update
    if @service.update(service_params)
      redirect_to @service, notice: 'Successfully updated.'
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @service.destroy
    redirect_to service_url, notice: 'Not longer offering this service.'
  end


  private

  def set_service
    @service = Service.find(params[:id])
    authorize @service
  end

  def service_params
    params.require(:service).permit(:description, :price, :available, :user_id)

  end

end
