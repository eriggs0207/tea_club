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

  def subscription_update_params
    params.permit(:status)
  end
end
