# -*- encoding: utf-8 -*-
# stub: cms_scanner 0.14.3 ruby lib

Gem::Specification.new do |s|
  s.name = "cms_scanner".freeze
  s.version = "0.14.3".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["WPScanTeam".freeze]
  s.date = "2024-09-05"
  s.description = "Framework to provide an easy way to implement CMS Scanners".freeze
  s.email = ["contact@wpscan.com".freeze]
  s.homepage = "https://github.com/wpscanteam/CMSScanner".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0".freeze)
  s.rubygems_version = "3.2.33".freeze
  s.summary = "CMS Scanner Framework (experimental)".freeze

  s.installed_by_version = "3.6.3".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<ethon>.freeze, [">= 0.14".freeze, "< 0.17".freeze])
  s.add_runtime_dependency(%q<get_process_mem>.freeze, ["~> 0.2.5".freeze])
  s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.16".freeze])
  s.add_runtime_dependency(%q<opt_parse_validator>.freeze, ["~> 1.10.0".freeze])
  s.add_runtime_dependency(%q<public_suffix>.freeze, [">= 4.0.3".freeze, "< 6.1".freeze])
  s.add_runtime_dependency(%q<ruby-progressbar>.freeze, [">= 1.10".freeze, "< 1.14".freeze])
  s.add_runtime_dependency(%q<typhoeus>.freeze, [">= 1.3".freeze, "< 1.5".freeze])
  s.add_runtime_dependency(%q<xmlrpc>.freeze, ["~> 0.3".freeze])
  s.add_runtime_dependency(%q<yajl-ruby>.freeze, ["~> 1.4.1".freeze])
  s.add_runtime_dependency(%q<sys-proctable>.freeze, [">= 1.2.2".freeze, "< 1.4.0".freeze])
  s.add_development_dependency(%q<bundler>.freeze, [">= 1.6".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.12.0".freeze])
  s.add_development_dependency(%q<rspec-its>.freeze, ["~> 1.3.0".freeze])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.26.0".freeze])
  s.add_development_dependency(%q<rubocop-performance>.freeze, ["~> 1.19.1".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.22.0".freeze])
  s.add_development_dependency(%q<simplecov-lcov>.freeze, ["~> 0.8.0".freeze])
  s.add_development_dependency(%q<webmock>.freeze, ["~> 3.19.1".freeze])
end
