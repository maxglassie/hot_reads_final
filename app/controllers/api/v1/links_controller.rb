class Api::V1::LinksController < ApplicationController
  def create
    @link = Link.new(link_params)
    if @link.save
      render json: {origin_id: @link.origin_id, url: @link.url, read: @link.read, number_one: @link.number_one?, top_ten: @link.top_ten?}, status: 201
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:origin_id, :url, :read)
  end
end