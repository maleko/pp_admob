# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pp_admob}
  s.version = "1.1.2a"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["AdMob, Marc Lee"]
  s.date = %q{2011-02-01}
  s.description = %q{Enables easy integration of AdMob ads into a RoR mobile site.}
  s.email = %q{marc@projectproject.com.au}
  s.extra_rdoc_files = ["lib/admob.rb", "README.txt"]
  s.files = ["History.txt", "lib/admob.rb", "Manifest.txt", "Rakefile", "README.txt", "Manifest", "admob.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/maleko/pp_admob}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Admob", "--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{admob}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Enables easy integration of AdMob ads into a RoR mobile site.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

