class FoldersController < ApplicationController
  def index
    render json: Folder.all.to_json
  end

  def create
    Folder.create(name: params[:name])
  end
end
