module Api
  module V1
    class ServicesController < Api::V1::BaseController
      include CustomErrors
      include CategoryIdCollector
      include ErrorSerializer

      before_action :authenticate_api_user!, except: [:index]

      def index
        location = Location.includes(
          services: %i[categories contacts phones regular_schedules
                       holiday_schedules]
        ).find(params[:location_id])
        services = location.services
        render json: services, status: 200
      end

      def update
        service = Service.find(params[:id])
        if service.update(service_params)
          render json: service,
                 serializer: ServiceSerializer,
                 status: 200
        else
          render json: ErrorSerializer.serialize(service.errors),
                 status: :unprocessable_entity
        end
      end

      def create
        location = Location.find(params[:location_id])
        service = location.services.build(service_params)
        if location.save
          render json: service, status: 201
        else
          render json: ErrorSerializer.serialize(service.errors),
                 status: :unprocessable_entity
        end
      end

      def destroy
        service = Service.find(params[:id])
        service.destroy
        head 204
      end

      def update_categories
        service = Service.find(params[:service_id])
        service.category_ids = cat_ids(params[:taxonomy_ids])
        service.save!

        render json: service, status: 200
      end

      private

      def service_params
        params.permit(
          :alternate_name,
          :audience,
          :description,
          :eligibility,
          :email,
          :fees,
          :application_process,
          :interpretation_services,
          :name,
          :status,
          :website,
          :wait_time,
          category_ids: [],
          required_documents: [],
          funding_sources: [],
          keywords: [],
          service_areas: [],
          accepted_payments: [],
          languages: [],
          regular_schedules_attributes: [
            :id,
            :opens_at,
            :closes_at,
            :weekday
          ],
          holiday_schedules_attributes: [
            :id,
            :closed,
            :start_date,
            :end_date,
            :opens_at,
            :closes_at
          ],
          phones_attributes: [
            :id,
            :department,
            :extension,
            :number,
            :number_type,
            :vanity_number
          ]
        )
      end
    end
  end
end
