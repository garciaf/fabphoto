
# Methods defined in the helpers block are available in templates

# Use LiveReload
activate :i18n

activate :livereload


activate :portfolio do |f|

  # # thumbnail width (px)
  f.thumbnail_width  = 350 

  # # thumbnail height (px)
  f.thumbnail_height = 350

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

# ignore '/portfolio.html.haml'


activate :directory_indexes

config = YAML.load_file("parameter.yml")

activate :deploy do |deploy|
  deploy.method = :ftp
  deploy.host = config['deploy']['host']
  deploy.user = config['deploy']['user']
  deploy.password = config['deploy']['password']
  deploy.path = config['deploy']['path']
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
