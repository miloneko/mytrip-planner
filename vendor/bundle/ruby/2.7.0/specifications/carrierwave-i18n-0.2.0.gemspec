# -*- encoding: utf-8 -*-
# stub: carrierwave-i18n 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "carrierwave-i18n".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mehdi Lahmam".freeze]
  s.date = "2017-04-07"
  s.email = ["mehdi@craftsmen.io".freeze]
  s.homepage = "https://github.com/carrierwaveuploader/carrierwave-i18n".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Locales for CarrierWave".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.11"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<i18n-spec>.freeze, ["~> 0.6.0"])
    s.add_development_dependency(%q<railties>.freeze, [">= 0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<i18n-spec>.freeze, ["~> 0.6.0"])
    s.add_dependency(%q<railties>.freeze, [">= 0"])
  end
end
