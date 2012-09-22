class ProjectsController < ApplicationController
  respond_to :json, :html
  helper_method :projects, :project
  # before_filter :remove_id
  def index
    respond_with projects do |format|
      format.json { render :layout => false, :text => projects.to_json}
    end
  end

  def new
    respond_with project
  end

  def create
    project.save
    respond_with project
  end

  def show
    respond_with project, :text => project
  end

  def update
    project.update_attributes(params[:project])
    respond_with project
  end

  def destroy
    project.destroy
    respond_with project
  end
  protected
  def project
    @project ||= params[:id].present? ? Project.includes(:quotes).find(params[:id]) : Project.new(params[:project])
  end

  def projects
    @projects ||= Project.all
  end

  def remove_id
    params[:project].delete("id") if (params[:project] || {}).has_key? "id"
  end
end

