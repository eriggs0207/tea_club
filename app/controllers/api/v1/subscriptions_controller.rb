class Api::V1::SubscriptionsController < ApplicationController

  def create
    customer = Customer.find_by(id: params[:customer_id])
    if customer.nil?
      render json: {errors: { message: "customer does not exist"}}, status: 401
    else
      SubscriptionSerializer.new(customer.subscriptions.create(subscription_params))
      render json: {success: { message: "Subscription has been created"}}, status: 201
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
