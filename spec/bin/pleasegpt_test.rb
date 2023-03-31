# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'pleasegpt executable' do
  it 'runs with the given arguments' do
    output = `bin/pleasegpt what is the capital of France?`
    expect(output).to_not be_empty
  end
end
