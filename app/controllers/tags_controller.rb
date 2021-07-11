class TagsController < ApplicationController
  def index
    render json: Tag.all.to_json
  end

  def create
    Tag.create!(name: params[:name])
  rescue ActiveRecord::RecordInvalid => e
    render status: :bad_request, json: { error: "A tag with that name already exists. Please use a different name." }
  end
end
