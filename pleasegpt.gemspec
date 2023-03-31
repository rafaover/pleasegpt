# rubocop:disable Style/StringLiterals
Gem::Specification.new do |spec|
  spec.name          = "pleasegpt"
  spec.version       = "0.1.0"
  spec.authors       = "Rafael Moreira"
  spec.email         = "rafamsilva@gmail.com"
  spec.summary       = "A wrapper around the OpenAI API Chat Model"
  spec.description = <<-EOF
    A Ruby gem that provides a wrapper around the OpenAI API.
    It allows you to generate natural language text based on a given prompt.
    EOF

  spec.homepage      = "https://github.com/rafaover/pleasegpt"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 2.6.0'

  spec.files         = Dir.glob("{bin,lib,spec}/**/*")
  spec.executables   = ["pleasegpt"]
  spec.require_paths = ["lib"]
  spec.post_install_message = "Thanks for installing! Please run `pleasegpt load-api` to configure the gem."

  spec.add_dependency 'ruby-openai', '~> 3.7'
  spec.add_dependency 'openai', '~> 0.3.0'
  spec.add_dependency 'dotenv', '~> 2.8', '>= 2.8.1'
  spec.add_dependency 'highline', '~> 2.1'
  spec.add_dependency 'colorize', '~> 0.8.1'
end
# rubocop:enable Style/StringLiterals
