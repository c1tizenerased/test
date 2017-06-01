require 'nokogiri'
require 'open-uri'
require 'fileutils'
require 'securerandom'

class PicsSaver
  attr_accessor :uri, :links

  def initialize(uri)
    @uri = uri
  end

  def save
    set_links
    save_pics
  end

  private

  def save_pics
    dir = SecureRandom.uuid
    links.each_with_index do |link, i|
      open(File.join(dir, i), 'wb') do |file|
        file << open(link).read
      end
    end
  end

  def set_links
    @links = \
      Nokogiri::HTML(open(url).read).css('img').map do |link|
        if (href = link.attr('src'))
          href
        end
      end.compact
  end
end