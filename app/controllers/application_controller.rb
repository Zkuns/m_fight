class ApplicationController < ActionController::API
  def current_user
    User.find_by(email: 'zhukun@geekpark.net')
  end
end
