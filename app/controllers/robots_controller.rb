# frozen_string_literal: true

class RobotsController < ApplicationController
  before_action :set_robot, only: %i[show edit update destroy]

  def index
    @robots = Robot.all
  end

  def new
    @robot = Robot.new
  end

  def create
    @robot = Robot.new robot_params

    if @robot.save
      redirect_to @robot, notice: 'Robot Successfully Created, Start Playing with it.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update; end

  def destroy
    if @robot.destroy
      flash[:notice] = 'Robot Successfully Deleted'
    else
      flash[:alert] = @robot.errors.full_messages.to_sentence
    end

    redirect_to robots_path
  end

  private

  def robot_params
    params.require(:robot).permit(:position_x, :position_y, :facing)
  end

  def set_robot
    @robot = Robot.find params[:id]
  end
end
