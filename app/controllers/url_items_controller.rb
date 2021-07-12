class UrlItemsController < ApplicationController
  def create
    if params.include?(:tags)
      tags = Tag.where(name: params[:tags])
      raise ActiveRecord::RecordInvalid if tags.empty?
    end
    UrlItem.create!(url: params[:url], name: params[:name], folder_id: params[:folder_id].to_i, description: params[:description])
  rescue ActiveRecord::RecordInvalid => e
    render status: :bad_request, json: { error: "Invalid parameter passed. Please try again" }
  end

  def search
    @url_items = UrlItem.where(name: params[:name])
    @url_items = @url_items.where(folder_id: params[:folder_id]) if params[:folder_id]
    render json: @url_items.where(name: params[:name]).to_json
  end
end
