module Api
  module V1
    class ContactPhonesController < Api::V1::BaseController
      include CustomErrors

      before_action :authenticate_api_user!

      def update
        phone = Phone.find(params[:id])
        phone.update!(params)
        render json: phone, status: 200
      end

      def create
        contact = Contact.find(params[:contact_id])
        phone = contact.phones.create!(params)
        render json: phone, status: 201
      end

      def destroy
        phone = Phone.find(params[:id])
        phone.destroy
        head 204
      end
    end
  end
end
