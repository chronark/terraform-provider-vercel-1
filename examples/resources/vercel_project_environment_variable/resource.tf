resource "vercel_project" "example" {
  name = "example-project"

  git_repository = {
    type = "github"
    repo = "vercel/some-repo"
  }
}

# An environment variable that will be created
# for this project for the "production" environment.
resource "vercel_project_environment_variable" "example" {
  project_id = vercel_project.example.id
  key        = "foo"
  value      = "bar"
  target     = ["production"]
}

# An environment variable that will be created
# for this project for the "preview" environment when the branch is "staging".
resource "vercel_project_environment_variable" "example_git_branch" {
  project_id = vercel_project.example.id
  key        = "foo"
  value      = "bar-staging"
  target     = ["preview"]
  git_branch = "staging"
}
