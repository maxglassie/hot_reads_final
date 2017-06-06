class LinksController < ApplicationController
  def index
    @links = Link.top_most_read
  end
end
