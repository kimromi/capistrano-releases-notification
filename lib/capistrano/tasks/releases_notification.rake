namespace :release do

  set :release_notify_channel, ['#general']
  set :release_notify_mention, []

  set :release_notify_message, -> {
    pull_request = Octokit.pull(fetch(:github_repo), fetch(:pull_request_id))
    "[ #{fetch(:release_title)} ] was released. #{fetch(:release_notify_mention).join(' ')}\n#{pull_request.html_url}"
  }

  desc "notify release to slack"
  task :notify do
    invoke 'github:releases:authentication'

    fetch(:release_notify_channel).each do |channel|
      set :slack_channel, channel

      attachments = [{
        color: 'good',
        title: fetch(:application),
        text:  fetch(:release_notify_message),
      }]
      body = JSON.generate(fetch(:slack_default_body).merge(attachments: attachments))
      fetch(:slack_client).post fetch(:slack_path), body
    end
  end
end
