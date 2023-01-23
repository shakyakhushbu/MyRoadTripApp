# -*- encoding: utf-8 -*-
# stub: has_secure_token 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "has_secure_token".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Roberto Miranda Altamar".freeze]
  s.date = "2015-04-24"
  s.description = "HasSecureToken provides you an easily way to geneatre uniques random tokens for any model in ruby on rails. **SecureRandom::base58** is used to generate the 24-character unique token, so collisions are highly unlikely.".freeze
  s.email = ["rjmaltamar@gmail.com".freeze]
  s.homepage = "https://github.com/robertomiranda/has_secure_token".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.7".freeze
  s.summary = "Create uniques random tokens for any model in ruby on rails. Backport of ActiveRecord::SecureToken 5 to AR 3.x and 4.x".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activerecord>.freeze, [">= 3.0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 3.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
  end
end
