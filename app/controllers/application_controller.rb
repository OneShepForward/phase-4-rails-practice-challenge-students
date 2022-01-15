class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_unproceesable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

    private

    def render_unproceesable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_record_not_found
        render json: { errors: ["Record not found"] }, status: :not_found
    end



end
