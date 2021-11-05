class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :signup_data_invalid

    def create
        new_signup = Signup.create!(signup_params)
        render json: new_signup.activity, status: :created
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def signup_data_invalid(error_messages)
        render json: { errors: error_messages.record.errors.full_messages }, status: :unprocessable_entity
    end
end