class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: Apartment.all
    end

    def create
        apartment = Apartment.create!(number: params[:number])   # not sure if this works
        render json: apartment, status: :created
    end

    def update
        apartment = Apartment.find(params[:id])
        apartment.update(number: params[:number])
        render json: apartment, status: :created
        
    end

    def destroy
        apartment = Apartment.find(params[:id])
        apartment.destroy
        render json: { }, status: :no_content
        
    end

    private

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end
