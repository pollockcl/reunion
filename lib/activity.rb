# Activity class
class Activity
  attr_reader :participants
  def initialize(name, participants = {})
    @name         = name
    @participants = participants
  end

  def add_participants(name, amt_paid)
    @participants[name] = amt_paid
  end

  def total_cost
    @participants.values.sum
  end
end
