Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_waiting_list'
  s.version     = '0.2.0'
  s.summary     = 'Add a waiting list to your spree store'
  s.description = 'The waiting list allows users to signup to be notified via email when an items comes back into stock'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Joshua Nussbaum'
  s.email             = 'joshnuss@gmail.com'
  s.homepage          = 'http://www.godynamo.com'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = false

  s.add_dependency('spree_core', '>= 0.40.0')
  s.add_dependency('haml', '> 0')
end
