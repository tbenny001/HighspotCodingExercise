class UrlItemsController < ApplicationController
  def create
    tags = Tag.where(name: params[:tags])
    if params.include?(:tags)
      raise ActiveRecord::RecordInvalid if tags.empty?
    else
    UrlItem.create!(url: params[:url], name: params[:name], folder_id: params[:folder_id].to_i, description: params[:description], tags: tags)
    end
  rescue ActiveRecord::RecordInvalid => e
    render status: :bad_request, json: { error: "Invalid parameter passed. Please try again" }
  end

  def search
    @url_items = UrlItem.where(name: params[:name])
    @url_items = @url_items.where(folder_id: params[:folder_id]) if params[:folder_id]
    render json: @url_items.to_json
  end
end
