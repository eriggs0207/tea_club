class Api::V1::SubscriptionsController < ApplicationController

  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      SubscriptionSerializer.new(subscription)
      render json: {success: { message: "Subscription has been created"}}, status: 201
    else
      render json: { errors: subscription.errors.full_messages }, status: 400
    end
  end

  def update
    subscription = Subscription.find(params[:id])
    if subscription.update(subscription_params)
      SubscriptionSerializer.new(subscription)
      render json: {success: { message: "Subscription has been updated"}}, status: 200
    else
      render json: {errors: { message: "no subscription found"}}, status: 404
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
