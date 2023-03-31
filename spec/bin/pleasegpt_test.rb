require 'spec_helper'

RSpec.describe 'pleasegpt executable' do
  it 'runs with the given arguments' do
    expect { system('bin/pleasegpt what is the capital of France?') }
      .to output(/\S/).to_stdout
      .and output(String).to_stdout
  end
end
