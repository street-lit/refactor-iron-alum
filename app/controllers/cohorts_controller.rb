class CohortsController < ApplicationController

  def index
    cohorts = Cohort.all
    render json: cohorts.to_json, status: 200
  end

  def show
    if Cohort.exists?(params[:id])
      cohort = Cohort.find(params[:id])
      render json: cohort.to_json, status: 200
    else
      render json: { error_message: "Error 404: Page Not Found" }.to_json, status: 404
    end
  end

  def new
    cohort = Cohort.new
    render json: cohort.to_json, status: 200
  end

  def create
    cohort = Cohort.new
    cohort.course_name = params.fetch(:course_name)
    cohort.location_id = params.fetch(:location_id)
    cohort.start_date = params.fetch(:start_date)
    cohort.end_date = params.fetch(:end_date)
    if cohort.save
      render json: cohort.to_json, status: 201
    else
      error_message = "The cohort was not completely filled out or not able to be created"
      render json: { error_message: error_message }.to_json, status: 422
    end
  end

  def update
    cohort = Cohort.find(params[:id])
    cohort.course_name = params.fetch(:course_name, cohort.course_name)
    cohort.location_id = params.fetch(:location_id, cohort.location_id)
    cohort.start_date = params.fetch(:start_date, cohort.start_date)
    cohort.end_date = params.fetch(:end_date, cohort.end_date)
    if cohort.save
      render json: cohort.to_json, status: 200
    else
      render json: { error_message: "Error 404: Page Not Updated! #{cohort.errors.messages}" }.to_json, status: 404
    end
  end

  def destroy
    if Cohort.exists?(params[:id])
      cohort = Cohort.find(params[:id])
      cohort.destroy
      render json: { message: "Cohort deleted successfully." }.to_json, status: 200
    else
      render json: { error_message: "Error 404: Page Not Found" }.to_json, status: 404
    end
  end
end
