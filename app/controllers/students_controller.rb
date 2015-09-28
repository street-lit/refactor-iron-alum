class StudentsController < ApplicationController

  def index
    students = Student.all
    render json: students.to_json, status: 200
  end

  def show
    if Student.exists?(params[:id])
      student = Student.find(params[:id])
      render json: student.to_json, status: 200
    else
      render json: { error_message: "Error 404: Page Not Found" }.to_json, status: 404
    end
  end

  def new
    student = Student.new
    render json: student.to_json, status: 200
  end

  def create
    student = Student.new
    student.f_name = params.fetch(:f_name)
    student.l_name = params.fetch(:l_name)
    student.email = params.fetch(:email)
    student.bio = params.fetch(:bio)
    student.linked_in = params.fetch(:linked_in)
    student.github = params.fetch(:github)
    student.employed = params.fetch(:employed)
    student.place_employed = params.fetch(:place_employed, student.place_employed)
    student.cohort_id = params.fetch(:cohort_id)
    student.location_id = params.fetch(:location_id)
    if student.save
      render json: student.to_json, status: 201
    else
      error_message = "The student was not completely filled out or not able to be created"
      render json: { error_message: error_message }.to_json, status: 422
    end
  end

  def update
    student = Student.find(params[:id])
    student.f_name = params.fetch(:f_name, student.f_name)
    student.l_name = params.fetch(:l_name, student.l_name)
    student.email = params.fetch(:email, student.email)
    student.bio = params.fetch(:bio, student.bio)
    student.linked_in = params.fetch(:linked_in, student.linked_in)
    student.github = params.fetch(:github, student.github)
    student.employed = params.fetch(:employed, student.employed)
    student.place_employed = params.fetch(:place_employed, student.place_employed)
    student.cohort_id = params.fetch(:cohort_id, student.cohort_id)
    student.location_id = params.fetch(:location_id, student.location_id)
    if student.save
      render json: student.to_json, status: 200
    else
      render json: { error_message: "Error 404: Page Not Updated!" }.to_json, status: 404
    end
  end

  def destroy
    if Student.exists?(params[:id])
      student = Student.find(params[:id])
      student.destroy
      render json: { message: "Student deleted successfully." }.to_json, status: 200
    else
      render json: { error_message: "Error 404: Page Not Found" }.to_json, status: 404
    end
  end
end
