class RequestsController < ApplicationController
  before_action :find_service, only: [:new,:create, :show, :edit, :update, :destroy]

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.service = @service
    @request.user = current_user
    @accepted = false
    @request.save
    redirect_to @service, notice: 'Great! The request has been sent to service owner!'
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  private

  def find_service
    @service = Service.find(params[:service_id])
    authorize @service
  end

  def request_params
    params.require(:request).permit(:message)
  end

end
