require 'spec_helper'

RSpec.describe "pleasegpt executable" do
  it "runs with the given arguments" do
    expect { system('bin/pleasegpt how much is 2+2') }
      .to output(/\S/).to_stdout
      .and output(String).to_stdout
  end
end
