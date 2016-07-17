require_relative '../../lib/helpers/git_helper'

class GitController < ApplicationController

  def pull
    update_repo('blog.conf')
    render nothing: true, status: 200, content_type: 'text/html'
  end

end
