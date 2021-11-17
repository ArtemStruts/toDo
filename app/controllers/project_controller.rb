class ProjectController < ApplicationController

  def index
    @projects = Project.includes(:todos).order(:id)
    render json: @projects
  end

  def create
    if params[:project_id].to_i == 0
      p = Project.new(title: params[:title])
      Todo.create(text: params[:text], project: p)
    else
      Todo.create(text: params[:text], project: Project.find(params[:project_id]))
    end
  end

  def update
    project = Project.find(params[:id])
    todo = project.todos.find(params[:task_id])
    todo.is_completed = !todo.is_completed
    todo.save
    project.save
  end
end
