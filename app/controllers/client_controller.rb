class ClientController < ApplicationController

  def index
  end

  def users
    @users = User.all.sort_by(&:points).reverse

    json = @users.as_json({
      :only    => [:name, :reference, :css],
      :methods => [:css, :points, :task_counter]
    })

    render :json => json
  end

  def tasks
    @tasks = Tasks.needs_attention.all

    json = @tasks.as_json({
      :only    => [:name, :reference, :css],
      :methods => [:name, :css, :points, :task_counter]
    })

    render :json => json
  end
end
