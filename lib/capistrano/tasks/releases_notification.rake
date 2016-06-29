namespace :release do

  set :release_notify_channel, ['#general']
  set :release_notify_mention, []
  set :release_notify_title,   fetch(:application)

  set :release_notify_message, -> {
    "It has released. #{fetch(:release_notify_mention).join(' ')}"
  }

  set :release_notify_attachment, -> {
    pull_request = Octokit.pull(fetch(:github_repo), fetch(:pull_request_id))
    "#{fetch(:release_title)}\n#{pull_request.html_url}"
  }

  desc "notify release to slack"
  task :notify do
    invoke 'github:releases:authentication'

    fetch(:release_notify_channel).each do |channel|
      set :slack_channel, channel

      attachments = [{
        color: 'good',
        title: fetch(:release_notify_title),
        text:  fetch(:release_notify_attachment),
      }]
      body = JSON.generate(fetch(:slack_default_body).merge(text: fetch(:release_notify_message), attachments: attachments))
      fetch(:slack_client).post fetch(:slack_path), body
    end
  end
end
