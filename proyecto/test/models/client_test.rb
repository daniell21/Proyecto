require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


test "should not save client without title" do
  client = Client.new
  assert_not client.save
end
end
