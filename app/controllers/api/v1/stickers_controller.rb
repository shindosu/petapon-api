class Api::V1::StickersController < ApplicationController
  def index
    @stickers = Sticker.all
  end

  # def show
  #   @st
  # end
end