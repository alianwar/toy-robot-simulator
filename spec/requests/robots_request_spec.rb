require 'rails_helper'

RSpec.describe "Robots", type: :request do
  let!(:robots) { FactoryBot.create_list(:robot, 5) }

  context 'GET #index' do
    before do
      get robots_path
    end

    it 'returns all robots' do
      expect(response).to have_http_status(200)
      expect(assigns(:robots)).not_to be_nil
      expect(assigns(:robots).count).to eq 5
    end
  end

  context 'GET #new' do
    before do
      get new_robot_path
    end

    it 'returns new robot' do
      expect(response).to have_http_status(200)
      expect(assigns(:robot)).not_to be_nil
      expect(assigns(:robot).new_record?).to be true
    end
  end

  context 'POST #create' do
    it 'should create new Robot' do
      expect do
        post robots_path, params: { robot: FactoryBot.build(:robot).attributes}
      end.to change { Robot.count }.by(1)
    end
  end

  context 'GET #show' do
    before do
      get robot_path(robots.last)
    end

    it 'returns robot details' do
      expect(response).to have_http_status(200)
    end
  end

  context 'GET #edit' do
    before do
      get edit_robot_path(robots.last), xhr: true
    end

    it 'returns new robot' do
      expect(response).to have_http_status(200)
    end
  end

  context 'PUT #update' do
    before do
      put robot_path(robots.last), params: { robot: robots.last.attributes }, xhr: true
    end

    it 'will update robot' do
      expect(response).to have_http_status(200)
    end
  end

  context 'DELETE #destroy' do
    it 'should delete Robot' do
      expect do
        delete robot_path(robots.last)
      end.to change { Robot.count }.by(-1)
    end
  end

  context 'GET #move' do
    before do
      robot = robots.last
      robot.update(position_x: 2, position_y: 2, facing: Robot::FACINGS[:north])

      get move_robot_path(robots.last), xhr: true
    end

    it 'will move robot' do
      expect(response).to have_http_status(200)
      expect(assigns(:robot).position_y).to eq 3
    end
  end

  context 'GET #move' do
    before do
      robot = robots.last
      robot.update(position_x: 4, position_y: 4, facing: Robot::FACINGS[:north])

      get move_robot_path(robots.last), xhr: true
    end

    it 'is an invalid move' do
      expect(response).to have_http_status(200)
      expect(assigns(:robot).invalid?).to be true
    end
  end

  context 'GET #move' do
    before do
      robot = robots.last
      robot.update(position_x: 0, position_y: 4, facing: Robot::FACINGS[:west])

      get move_robot_path(robots.last), xhr: true
    end

    it 'is an invalid move' do
      expect(response).to have_http_status(200)
      expect(assigns(:robot).invalid?).to be true
    end
  end

  context 'GET #left' do
    before do
      robot = robots.last
      robot.update(position_x: 2, position_y: 2, facing: Robot::FACINGS[:north])

      get left_robot_path(robots.last), xhr: true
    end

    it 'will turn robot left' do
      expect(response).to have_http_status(200)
      expect(assigns(:robot).facing).to eq Robot::FACINGS[:west]
    end
  end

  context 'GET #right' do
    before do
      robot = robots.last
      robot.update(position_x: 2, position_y: 2, facing: Robot::FACINGS[:north])

      get right_robot_path(robots.last), xhr: true
    end

    it 'will turn robot left' do
      expect(response).to have_http_status(200)
      expect(assigns(:robot).facing).to eq Robot::FACINGS[:east]
    end
  end

  context 'GET #report' do
    before do
      robot = robots.last
      robot.update(position_x: 2, position_y: 2, facing: Robot::FACINGS[:north])

      get report_robot_path(robots.last), xhr: true
    end

    it 'will display robot report' do
      expect(response).to have_http_status(200)
    end
  end
end
