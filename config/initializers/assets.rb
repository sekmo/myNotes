# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Rails.application.config.assets.paths << "#{Rails.root}/vendor/assets/fonts"
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')



# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( ckeditor/* )

#Rails.application.config.assets.precompile += %w( .ttf .woff .woff2 .otf )
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
#Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf|otf|woff2)\z/
