Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_waiting_list'
  s.version     = '2.3.1'
  s.summary     = 'Add a waiting list to your spree store'
  s.description = 'The waiting list allows users to signup to be notified via email when an items comes back into stock'
  s.required_ruby_version = '>= 1.9.3'

  s.author            = 'Joshua Nussbaum'
  s.email             = 'joshnuss@gmail.com'
  s.homepage          = 'http://www.godynamo.com'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = false

  s.add_dependency 'spree_core', '~> 2.3.9'
  s.add_dependency 'haml', '~> 4.0.6'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 4.0.2'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
