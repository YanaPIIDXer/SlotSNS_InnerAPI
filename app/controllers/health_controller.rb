class HealthController < ApplicationController
  def index
    render json: { 'condition' => 'ok' }
  end
end
