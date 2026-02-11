MRuby::Gem::Specification.new('mruby-bearssl') do |spec|
  spec.license = 'MIT License'
  spec.authors = 'yamori813@yahoo.co.jp'
  spec.version = "0.0.1"

  bearssl_dirname = 'bearssl-0.6'
  bearssl_src = "#{spec.dir}/#{bearssl_dirname}"
  spec.cc.include_paths << "#{bearssl_src}/inc"
  spec.linker.library_paths << "#{bearssl_src}/build"
  spec.linker.libraries << ['bearssl']

  def self.run_command(env, command)
    fail "#{command} failed" unless system(env, command)
  end

  run_command({}, "cd #{bearssl_src}; make CONF=mruby")
end
