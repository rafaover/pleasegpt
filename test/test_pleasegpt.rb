require 'minitest/autorun'
require_relative '../lib/pleasegpt'

class PleaseGPTTest < Minitest::Test
  def test_generate_text
    assert_kind_of String, PleaseGPT::Api.generate_text('Hello')
  end
end
