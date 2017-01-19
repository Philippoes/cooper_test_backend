class Api::V1::PerformanceDataController < ApplicationController
  before_action :authenticate_api_v1_user!

  def create
    binding.pry
    @data = PerformanceData.create(performance_data_params.merge(user: current_api_v1_user)).valid?
    render json: {message: 'all good'}
  else
    render json: {error: @data.errors.full_messages}
    end

  private

  def performance_data_params
    params.require(:performance_data).permit!
  end
end
