require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_existence
    participants = { 'Legolas' => 2 }
    act = Activity.new('Taking the hobbits to Isengargd', participants)

    assert_instance_of Activity, act
  end

  def test_add_participants
    participants = { 'Legolas' => 2 }
    act = Activity.new('Taking the hobbits to Isengargd', participants)

    act.add_participants('Gimli', 3)

    assert_equal 2, act.participants.size
  end

  def test_total_cost
    participants = { 'Legolas' => 2,
                     'Gimli'   => 1 }
    act = Activity.new('Taking the hobbits to Isengargd', participants)

    assert_equal 3, act.total_cost
  end
end
