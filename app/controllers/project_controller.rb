class ProjectController < ApplicationController

  def index
    @projects = Project.includes(:todos)
    render json: @projects
  end

  def create
    if params[:project_id].to_i == 0
      p = Project.new(title: params[:title])
      Todo.create(text: params[:text], project: p)
    else
      p = Project.find(params[:project_id])
      Todo.create(text: params[:text], project: p)
    end
    render json: p
  end

  def update
    project = Project.find(params[:id])
    todo = project.todos.find(params[:task_id])
    todo.is_completed = !todo.is_completed
    todo.save
    project.save

    render json: todo
  end

end
