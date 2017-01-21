class Api::V1::PerformanceDataController < ApplicationController
  before_action :authenticate_api_v1_user!

  def create

    case performance_data_params['data']['message']
      when 'Excellent', 'Above average', 'Average', 'Below average', 'Poor'
      then
        if PerformanceData.create(performance_data_params.merge(user: current_api_v1_user)).valid?
          render json: {message: 'Success!'}
        else
          render json: {error: PerformanceData.errors.full_messages}
        end
      else
        response.status = 401
        render json: {errors: ['Data is not valid']}
    end
  end

  def index
    @collection = current_api_v1_user.performance_data
    render json: {entries: @collection}
  end

  private

  def performance_data_params
    params.require(:performance_data).permit!
  end
end

