class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  class NotFound < StandardError; end
  class Unprocessable < StandardError; end

  rescue_from 'Exception' do |exception|
    render :json => { :error => exception.message }, :status => 500
  end

  rescue_from 'ApplicationController::NotFound' do |exception|
    render :json => { :error => exception.message }, :status => 404
  end

  rescue_from 'ApplicationController::Unprocessable' do |exception|
    render :json => { :error => exception.message }, :status => 422
  end
end
