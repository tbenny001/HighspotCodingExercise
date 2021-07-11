class TagsController < ApplicationController
  def index
    render json: Tag.all.to_json
  end

  def create
    Tag.create(name: params[:name])
  end
end
