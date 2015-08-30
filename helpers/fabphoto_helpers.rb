require 'ostruct'
require 'digest/md5'

module FabphotoHelpers
  
  def home_path
    "/"
  end

  def blog_author
    OpenStruct.new(fabphoto[:author])
  end
  
  def gravatar(size = 68)
    md5 = Digest::MD5.hexdigest(blog_author.gravatar_email.downcase)
    "https://www.gravatar.com/avatar/#{md5}?size=#{size}"
  end

  def css_class(path)
    "active" if current_page.url == path
  end
  def portfolio_path
    opts = extensions[:portfolio].options
    if opts.defines_setting?(:portfolio_dir) 
      "/#{opts.portfolio_dir}/"
    else
      home_path
    end
  end
  
end