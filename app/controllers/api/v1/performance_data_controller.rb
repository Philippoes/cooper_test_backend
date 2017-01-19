class Api::V1::PerformanceDataController < ApplicationController
  def create
    binding.pry
    PerformanceData.create(params[:performance_data]).valid?
    render json: { message: 'all good' }
  end
end