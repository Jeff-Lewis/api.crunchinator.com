# For the v1/categories endpoints
class V1::CategoriesController < ApplicationController

  # render all categories to json
  def index
    @categories = Category.legit
    @status = 200
    render json: @categories, status: @status, each_serializer: V1::Categories::CategorySerializer
  end
end
