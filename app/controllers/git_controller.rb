require_relative '../../lib/helpers/git_helper'

class GitController < ApplicationController

  def pull
    update_repo('blog.conf')
    render :temp
  end

end
