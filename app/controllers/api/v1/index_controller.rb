class Api::V1::IndexController < Api::V1::ApplicationController
  def index
    render plain: 'IELTS College V1'
  end
end