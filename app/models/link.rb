class Link < ApplicationRecord
  validates_presence_of :url


  def self.top_most_read
    find_by_sql([
      "select l.url, count(l.url) as rank
      from links l
      where  l.created_at >= NOW() - '1 day'::INTERVAL
      group by l.url
      order by rank desc
      limit 10;"])
  end

  def number_one?
    if self.url == Link.top_most_read[0].url
      true
    else
      false
    end
  end

  def top_ten?
    top_most_read = Link.top_most_read
    top_most_read.any? do |link|
      link.url == self.url
    end
  end
end