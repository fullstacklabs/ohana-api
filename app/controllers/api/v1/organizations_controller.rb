module Api
  module V1
    class OrganizationsController < ApplicationController
      include TokenValidator
      include PaginationHeaders
      include CustomErrors

      def index
        per_page = params[:per_page] || 10
        orgs = Organization.includes(:contacts, :phones, :location).
                 ransack(params[:filters]).
                 result.uniq.
               page(params[:page]).per(per_page)

        render json: {
          organizations: ActiveModel::ArraySerializer.new(orgs, each_serializer: OrganizationSerializer),\
          metadata: {
            pagination: {
              per_page: per_page,
              total_pages: orgs.total_pages,
              prev_page: orgs.prev_page,
              current_page: orgs.current_page,
              next_page: orgs.next_page,
            },
            total_organizations: orgs.total_count
          }
        }, status: 200
        generate_pagination_headers(orgs)
      end

      def show
        org = Organization.find(params[:id])
        render json: org, status: 200
      end

      def update
        org = Organization.find(params[:id])
        org.update!(params)
        render json: org, status: 200
      end

      def create
        org = Organization.create!(params)
        render json: org, status: 201, location: [:api, org]
      end

      def destroy
        org = Organization.find(params[:id])
        org.destroy
        head 204
      end

    end
  end
end
