class FoldersController < ApplicationController
  def index
    render json: Folder.all.to_json
  end

  def create
    Folder.create!(name: params[:name])
  rescue ActiveRecord::RecordInvalid => e
    render status: :bad_request, json: { error: "A folder with that name already exists. Please use a different name." }
  end
end
