require 'rspec'
require 'openai'
require 'pleasegpt/cli'
require_relative '../../lib/pleasegpt/cli'
require_relative '../../lib/pleasegpt'

RSpec.describe 'pleasegpt executable' do
  it 'runs the CLI without error' do
    expect { system('bin/pleasegpt') }.to output(/pleasegpt>/).to_stdout_from_any_process
  end
end
