class Api::V1::StickerInstancesController < ApplicationController
  before_action :set_sticker_instance, only: [:show, :update, :destroy]

  def index
    @sticker_instance = StickerInstance.all
  end

  def show
    render json: @sticker_instance
  end

  def create
    @sticker_instance = StickerInstance.new(sticker_instance)
    if @sticker_instance.save
      render json: {status: "sticker_instance created!", data: @sticker_instance}
    else
      render_error
    end
  end

  def update
    if @sticker_instance.update(sticker_instance)
      render json: {status: "sticker_instance updated!", data: @sticker_instance}
    else
      render_error
    end
  end

  def destroy
    @sticker_instance.destroy
    head :no_content
  end

  private
  def set_sticker_instance
    @sticker_instance = StickerInstance.find(params[:id])
  end

  def sticker_instance
    params.require(:sticker_instance).permit(:title, :user_id)
  end

  def render_error
    render json: {error: @sticker_instance.errors.full_messages}, status: :unprocessable_entity
  end
end