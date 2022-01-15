class InstructorsController < ApplicationController

    def index
        teacher = Instructor.all
        render json: teacher, status: :ok
    end

    def show
        teacher = Instructor.find(params[:id])
        render json: teacher, status: :ok
    end

    def create
        teacher = Instructor.create!(instructor_params)
        render json: teacher, status: :created
    end

    def destroy
        teacher = Instructor.find(params[:id])
        teacher.destroy
        render status: :ok
    end
    
    def update
        teacher = Instructor.find(params[:id])
        teacher.update!(instructor_params)
        render json: teacher, status: :ok
    end

    private

    def instructor_params
        params.permit(:name)
    end

end
