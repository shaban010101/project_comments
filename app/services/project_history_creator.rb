class ProjectHistoryCreator
  def initialize(project_id, change)
    @project_id = project_id
    @change = change
  end

  def call
    project_history = ProjectHistory.create(
      project_id: project_id,
      change: change
    )

    project_history.persisted? ? true : false
  end

  private
  attr_reader :change, :project_id
end
