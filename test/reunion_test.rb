require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new('Middle Earth')
  end

  def test_existence
    assert_instance_of Reunion, @reunion
  end

  def test_add_activities
    participants = { 'Legolas' => 2,
                     'Gimli'   => 4 }
    act = Activity.new('Taking the hobbits to Isengargd', participants)
    @reunion.add_activity(act)

    assert_instance_of Activity, @reunion.activities.first
    assert_equal 1, @reunion.activities.size
  end
end
