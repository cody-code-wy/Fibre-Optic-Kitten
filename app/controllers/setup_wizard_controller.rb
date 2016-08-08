class SetupWizardController < ApplicationController
  skip_before_action :verify_authenticity_token

  def setup
    if File.exist?('repo.conf')
      redirect_to '/'
    else
      render 'setup_wizard/index'
    end
  end

  def submit
    data_hash = {}
    unless params[:'clone-url'].empty?
      data_hash = {repo: params[:'clone-url'], branch: 'master', username: params[:'user-name'],
                   password: params[:password], shortname: params[:'blog-short'], fullname: params[:'blog-name']}
    else
      data_hash = {repo: params[:'github-url'], branch: 'master', githubuser: params[:'github-uname'],
                   username: params[:'user-name'], password: params[:password], shortname: params[:'blog-short'],
                   fullname: params[:'blog-name']}
    end
    json = JSON.generate(data_hash)
    File.open('repo.conf', 'w') { |f| f.write(json) }

    redirect_to '/git/pull'
  end
end
