require 'slim'

configure :development do
  activate :livereload
end

# Add bower's directory to sprockets asset path
after_configuration do
  sprockets.append_path File.join "#{root}", "node_modules"
end

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash

  # activate :relative_assets
  # set :relative_links, true
end
