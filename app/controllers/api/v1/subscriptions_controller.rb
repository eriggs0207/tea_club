# frozen_string_literal: true

module Api
  module V1
    class SubscriptionsController < ApplicationController
      def create
        subscription = Subscription.new(subscription_params)
        if subscription.save
          SubscriptionSerializer.new(subscription)
          render json: { success: { message: 'Subscription has been created' } }, status: 201
        else
          render json: { errors: subscription.errors.full_messages }, status: 400
        end
      end

      def update
        subscription = Subscription.find(params[:id])
        if subscription.update(subscription_params)
          SubscriptionSerializer.new(subscription)
          render json: { success: { message: 'Subscription has been updated' } }, status: 200
        else
          render json: { errors: subscription.errors.full_messages }, status: 400
        end
      end

      def index
        customer = Customer.find_by(id: params[:customer_id])
        if customer
          render json: SubscriptionSerializer.new(customer.subscriptions)
        else
          render json: { errors: { message: 'Customer does not exist' } }, status: 401
        end
      end

      private

      def subscription_params
        params.require(:subscription).permit(
          :title,
          :price,
          :status,
          :frequency,
          :customer_id,
          :tea_id
        )
      end
    end
  end
end
