# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  protected

  def not_found(error = nil)
    error = 'Not found.' if error.blank?

    redirect_to root_path, alert: error
  end
end
