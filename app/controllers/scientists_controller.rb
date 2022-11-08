class ScientistsController < ApplicationController

  def index
    render json: Scientist.all, status: :ok
  end

  def show
    render json: find_sci, status: :ok, serializer: ScientistWithPlanetsSerializer
  end

  def create
    render json: Scientist.create!(sci_params), status: :created
  end

  def update
    find_sci.update!(sci_params)
    render json: find_sci, status: :accepted
  end

  def destroy
    find_sci.destroy
    head :no_content
  end

  private

  def find_sci
    Scientist.find(params[:id])
  end

  def sci_params
    params.permit(:name, :field_of_study, :avatar)
  end
end
