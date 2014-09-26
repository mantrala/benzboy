require './test/test_helper'

class BenzCarTest < Minitest::Test
  def test_exists
    assert Benzboy::Car
  end
end