class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top privacy terms]
  def top; end

  def privacy; end

  def terms; end
end
