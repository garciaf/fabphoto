require 'ostruct'
require 'digest/md5'

module FabphotoHelpers
  
  def page_title
    if is_album_page?
      album_title
    elsif current_page.data.title
      current_page.data.title
    else
      "Fabphoto"
    end
  end

  def album_title(name=nil)
    name ||= current_resource.metadata[:locals][:name]
    key = "portfolio.#{current_resource.metadata[:locals][:name]}"
    if I18n.exists? key
      I18n.t key
    else
      current_resource.metadata[:locals][:name]
    end
  end

  def is_album_page?
    current_resource.metadata[:locals][:name].present?
  end

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