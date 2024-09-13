(1..10).to_a.each do |number|
  Project.find_or_create_by!(name: "Project #{number}")
end

Project.all.each do |project|
  (1..10).to_a.each do |number|
    comment = "Comment #{number}"
    commentor = "Commentor #{number}"

    project.comments.create(
      comment: comment,
      commentor: commentor,
      project: project
    )

    ProjectHistoryCreator.new(
      project.id,
      "New Comment: comment: #{comment} commentor: #{commentor}"
    ).call
  end

  [ "in_progress", "complete" ].each do |status|
    project.update(status: status)
    ProjectHistoryCreator.new(project.id, "Project status change to: #{status}").call
  end
end
