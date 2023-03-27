Gem::Specification.new do |spec|
  spec.name          = "pleasegpt"
  spec.version       = "0.1.0"
  spec.authors       = ["Rafael Moreira"]
  spec.email         = ["rafamsilva@gmail.com"]
  spec.summary       = "A command-line tool for generating responses or commands using the OpenAI API"
  spec.homepage      = "https://github.com/rafaover/pleasegpt"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{lib}/**/*")
  spec.executables   = ["pleasegpt"]
  spec.require_paths = ["lib"]

  spec.add_dependency "openai"
  spec.add_dependency "dotenv"
end
