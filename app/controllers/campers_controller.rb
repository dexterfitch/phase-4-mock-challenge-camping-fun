class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :camper_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :camper_data_invalid

    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperWithActivitiesSerializer
    end

    def create
        new_camper = Camper.create!(camper_params)
        render json: new_camper, status: :created
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def camper_not_found
        render json: { error: "Camper not found" }, status: :not_found
    end

    def camper_data_invalid(error_messages)
        render json: { errors: error_messages.record.errors.full_messages }, status: :unprocessable_entity
    end
end
