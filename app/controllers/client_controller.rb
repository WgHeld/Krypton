class ClientController < ApplicationController

  def index
  end

  def users
    @users = User.includes(:tasks).all.sort_by(&:points).reverse

    json = @users.as_json({
      :only    => [:name, :reference, :image],
      :methods => [:css, :points, :task_counter]
    })

    render :json => json
  end

  def tasks
    @tasks = Task.needs_attention.all

    json = @tasks.as_json({
      :only    => [:id],
      :methods => [:image, :description, :css, :expected_points, :claimed?, :user_image]
    })

    render :json => json
  end

  def claim
    task = find_task(params[:task_id]) || raise(NotFound, "No Task found for '#{params[:task_id]}'")
    user = find_user(params[:user])    || raise(NotFound, "No User found for '#{params[:user]}'")

    claim_task(task, user)

    json = @tasks.as_json({
      :only    => [:id],
      :methods => [:image, :description, :css, :expected_points, :claimed?, :user_image]
    })

    render :json => json
  end
end
