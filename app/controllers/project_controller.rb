class ProjectController < ApplicationController
  def index
    @projects = Project.includes(:todos)
    @projects.to_json
  end

  def create
    Todo.create(text: params[:text], project: Project.find(params[:project_id]))
  end

  def update
    project = Project.find(params[:id])
    todo = project.todos.find(params[:task_id])
    todo.is_completed = !todo.is_completed
    todo.save
    project.save
  end
end
