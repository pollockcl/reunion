require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def setup
    participants = { 'Legolas' => 2,
                      'Gimli'   => 4 }
    @act = Activity.new('Taking the hobbits to Isengargd', participants)
  end

  def test_existence
    assert_instance_of Activity, @act
  end

  def test_add_participants
    @act.add_participants('Gandalf', 3)

    assert_equal 3, @act.participants.size
  end

  def test_total_cost
    assert_equal 6, @act.total_cost
  end

  def test_split_cost
    assert_equal 3, @act.split_cost
  end

  def test_debts
    assert_equal -1, @act.debts('Legolas')
    assert_equal 1, @act.debts('Gimli')
    assert_equal 'who?', @act.debts('Ned')
  end
end
