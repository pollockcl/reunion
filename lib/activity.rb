# Activity class
class Activity
  attr_reader name, :participants
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

  def split_cost
    total_cost / @participants.size
  end

  def debts(name)
    return 'who?' if @participants[name].nil?
    @participants[name] - split_cost
  end
end
