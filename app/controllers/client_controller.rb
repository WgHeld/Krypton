class ClientController < ApplicationController

  def index
  end

  def users
    @users = User.includes(:tasks).all.sort_by(&:points).reverse

    json = @users.as_json({
      :only    => [:name, :reference],
      :methods => [:css, :points, :task_counter]
    })

    render :json => json
  end

  def tasks
    @tasks = Task.needs_attention.all

    json = @tasks.as_json({
      :methods => [:name, :css, :expected_points]
    })

    render :json => json
  end
end
