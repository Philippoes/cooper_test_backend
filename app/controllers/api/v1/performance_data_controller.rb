class Api::V1::PerformanceDataController < ApplicationController
  def create
    Performance_data.create(data: params[:performance_data]).valid?
    render json: { message: 'all good' }
  end
end