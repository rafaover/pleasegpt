# rubocop:disable Style/StringLiterals
Gem::Specification.new do |spec|
  spec.name          = "pleasegpt"
  spec.version       = "0.1.0"
  spec.authors       = ["Rafael Moreira"]
  spec.email         = ["rafamsilva@gmail.com"]
  spec.summary       = "A Ruby Gem command-line tool for generating responses using the OpenAI API"
  spec.homepage      = "https://github.com/rafaover/pleasegpt"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{bin,lib,spec}/**/*")
  spec.executables   = ["pleasegpt"]
  spec.require_paths = ["lib"]

  spec.add_dependency 'ruby-openai', '~> 3.7'
  spec.add_dependency 'openai', '~> 0.3.0'
  spec.add_dependency 'dotenv', '~> 2.8', '>= 2.8.1'
  spec.add_runtime_dependency 'highline', '~> 2.1'
  spec.add_runtime_dependency 'colorize', '~> 0.8.1'
end
# rubocop:enable Style/StringLiterals
