# -*- encoding: utf-8 -*-
# stub: ridgepole 0.6.3 ruby lib

Gem::Specification.new do |s|
  s.name = "ridgepole"
  s.version = "0.6.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Genki Sugawara"]
  s.date = "2015-10-27"
  s.description = "Ridgepole is a tool to manage DB schema. It defines DB schema using Rails DSL, and updates DB schema according to DSL."
  s.email = ["sugawara@cookpad.com"]
  s.executables = ["ridgepole"]
  s.files = ["bin/ridgepole"]
  s.homepage = "https://github.com/winebarrel/ridgepole"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Ridgepole is a tool to manage DB schema."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["~> 4.2.1"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 3.0.0"])
      s.add_development_dependency(%q<mysql2>, ["~> 0.3.20"])
      s.add_development_dependency(%q<pg>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<activerecord-mysql-awesome>, [">= 0.0.7"])
      s.add_development_dependency(%q<migration_comments>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, ["~> 4.2.1"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 3.0.0"])
      s.add_dependency(%q<mysql2>, ["~> 0.3.20"])
      s.add_dependency(%q<pg>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<activerecord-mysql-awesome>, [">= 0.0.7"])
      s.add_dependency(%q<migration_comments>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["~> 4.2.1"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 3.0.0"])
    s.add_dependency(%q<mysql2>, ["~> 0.3.20"])
    s.add_dependency(%q<pg>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<activerecord-mysql-awesome>, [">= 0.0.7"])
    s.add_dependency(%q<migration_comments>, [">= 0"])
  end
end
