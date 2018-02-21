require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new('Middle Earth')
    participants_one   = { 'Legolas' => 2,
                           'Gimli'   => 4 }
    participants_two   = { 'Gandalf'   => 20,
                           'Aragorn'   => 14 }
    participants_three = { 'Aragorn' => 21,
                           'Legolas' => 20,
                           'Gimli'   => 19 }
    @act_one = Activity.new('Taking the hobbits to Isengargd', participants_one)
    @act_two = Activity.new('Flying like fools', participants_two)
    @act_three = Activity.new('Tracking', participants_three)
  end

  def test_existence
    assert_instance_of Reunion, @reunion
  end

  def test_add_activities
    @reunion.add_activity(@act_one)

    assert_instance_of Activity, @reunion.activities.first
    assert_equal 1, @reunion.activities.size
  end

  def test_total_cost
    @reunion.add_activity(@act_one)
    assert_equal 6, @reunion.total_cost

    @reunion.add_activity(@act_two)
    assert_equal 40, @reunion.total_cost
  end

  def test_breakdown
    @reunion.add_activity(@act_one)
    @reunion.add_activity(@act_two)
    @reunion.add_activity(@act_three)

    assert_equal 0, @reunion.breakdown['Gimli']
    assert_equal 3, @reunion.breakdown['Gandalf']
  end
end
