class StudentsController < ApplicationController

    def index
        pupil = Student.all
        render json: pupil, status: :ok
    end

    def show
        pupil = Student.find(params[:id])
        render json: pupil, status: :ok
    end

    def create
        pupil = Student.create!(student_params)
        render json: pupil, status: :created
    end

    def destroy
        pupil = Student.find(params[:id])
        pupil.destroy
        render status: :ok
    end
    
    def update
        pupil = Student.find(params[:id])
        pupil.update!(student_params)
        render json: pupil, status: :ok
    end

    
    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    
end
