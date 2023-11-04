class TaskMailer < ApplicationMailer
  def task_created(task, project)
    @task = task
    @project = project
    @project_memberships = ProjectMembership.where(project_id: project.id)

    @project_memberships.each do |membership|
      if membership.role == 'owner'
        mail(to: membership.user.email, subject: "New Task Created in Your Project!")
      elsif membership.role == 'member'
        mail(to: membership.user.email, subject: "New Task Created in Project!")
      end
    end
  end

  def task_updated(task, project)
    @task = task
    @project = project
    @project_memberships = ProjectMembership.where(project_id: project.id)

    @project_memberships.each do |membership|
      mail(to: membership.user.email, subject: "A task has been updated!")
    end
  end

  def task_deleted(task_name, task_description, project)
    @task_name = task_name
    @task_description = task_description
    @project = project
    @project_memberships = ProjectMembership.where(project_id: project.id)

    @project_memberships.each do |membership|
      mail(to: membership.user.email, subject: "A task has been deleted from the project!")
    end
  end
end
