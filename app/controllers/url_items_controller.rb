class UrlItemsController < ApplicationController
  def create
    UrlItem.create!(url: params[:url], name: params[:name], folder_id: params[:folder_id].to_i)
  rescue ActiveRecord::RecordInvalid => e
    render status: :bad_request, json: { error: "Invalid parameter passed. Please try again" }
  end
end
