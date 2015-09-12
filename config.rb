
# Methods defined in the helpers block are available in templates

# Use LiveReload
activate :i18n

activate :livereload


activate :portfolio do |f|

  # # thumbnail width (px)
  f.thumbnail_width  = 300 

  # # thumbnail height (px)
  f.thumbnail_height = 300

  # f.thumbnail_class ""
  
  f.thumbnail_link_class = "swipebox thumbnail"

  # override default portfolio template (must be located in source/)
  f.portfolio_template=  "portfolio.html.haml"

  # override default project template (also must be in source/)
  f.project_template= "project.html.haml"
end
activate :middleman_simple_thumbnailer

# Compass configuration
set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :partials_dir, 'partials'

set :fabphoto, {
  author: {
    name: 'Fabien',
    bio: 'Developer by day, fighter and cook by night',
    location: 'Berlin',
    website: "http://blog.fabbook.fr", # Optional
    gravatar_email: 'fab0670312047@gmail.com' # Optional
  }
}


activate :directory_indexes
set :url_root, 'http://fabphoto.fr'
activate :search_engine_sitemap


config = YAML.load ERB.new(File.read('parameter.codeship.yml')).result(binding)

###
# Helpers
###
activate :deploy do |deploy|
  deploy.method = :ftp
  deploy.host = config['FTP_HOST']
  deploy.user = config['FTP_USER']
  deploy.password = config['FTP_PASSWORD']
  deploy.path = config['path']
  deploy.build_before = true # default: false
end

# Build-specific configuration
configure :build do
  ignore 'project.html'
  ignore 'images/*.psd'
  ignore 'stylesheets/lib/*'
  ignore 'stylesheets/vendor/*'
  ignore 'javascripts/lib/*'
  ignore 'javascripts/vendor/*'

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  activate :imageoptim
  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
