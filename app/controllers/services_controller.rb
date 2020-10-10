class ServicesController < ApplicationController
  before_action :find_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = policy_scope(Service).order(created_at: :desc)
  end

  def show; end

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

  def edit; end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service), notice: 'Successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @service.destroy
    redirect_to service_url, notice: 'Not longer offering this service.'
  end


  private

  def find_service
    @service = Service.find(params[:id])
    authorize @service
  end

  def service_params
    params.require(:service).permit(:description, :price, :available, :photo)
  end

end
