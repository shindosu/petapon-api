class Api::V1::DeviceInstancesController < ApplicationController
  before_action :set_device_instance, only: [:show, :update, :destroy]

  def show
    render json: @device_instance
  end

  def create
    @device_instance = DeviceInstance.new(device_instance)
    if @device_instance.save
      render json: {status: "device_instance created!", data: @device_instance}
    else
      render_error
    end
  end

  def update
    if @device_instance.update(device_instance)
      render json: {status: "device_instance updated!", data: @device_instance}
    else
      render_error
    end
  end

  def destroy
    @device_instance.destroy
    head :no_content
  end

  private
  def set_device_instance
    @device_instance = DeviceInstance.find(params[:id])
  end

  def device_instance
    params.require(:device_instance).permit(:title, :user_id)
  end

  def render_error
    render json: {error: @device_instance.errors.full_messages}, status: :unprocessable_entity
  end
end