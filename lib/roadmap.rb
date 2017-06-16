module Roadmap

  def get_roadmap(roadmap_id)
    response = self.class.get(api_url("roadmaps/#{roadmap_id}"),
      headers: { "authorization" => @auth_token})
    @roadmaps = JSON.parse(response.body)
    # p @roadmaps
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get(api_url("checkpoints/#{checkpoint_id}"),
      headers: { "authorization" => @auth_token})
    @checkpoints = JSON.parse(response.body)
    # p @checkpoints
  end

  def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment, enrollment_id = @enrollment_id)
    response = self.class.post(api_url("checkpoint_submissions"),
      body: {
        checkpoint_id: checkpoint_id,
        assignment_branch: assignment_branch,
        assignment_commit_link: assignment_commit_link,
        comment: comment,
        enrollment_id: @enrollent_id
      },
      headers: { "authorization" => @auth_token })
    JSON(response.body)
  end

  private
  #                   test perameters
  # "assignment_branch":"checkpoint25-rails-authentication-signing-up"
  # "assignment_commit_link":"https://github.com/jjw244/Bloccit/commit/95711ee7975a5f4a1a1684bcea452b693ee53568"
  # "checkpoint_id":1642
  # "comment":"This is a comment from KeleClient to Checkpoint 25 - Bloccit"

  # roadmap_id: 38
  # checkpoint_id: 2265
end
