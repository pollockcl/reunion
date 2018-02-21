# This is the Reunion class
class Reunion
  attr_reader :activities
  def initialize(location)
    @location   = location
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.map(&:total_cost).sum
  end

  def breakdown
    extract_and_merge
  end

  def print_debts
    formatted = ''
    breakdown.sort.each { |person| formatted << person.to_s + "\n" }
    formatted.gsub!(':', ' owes')
    formatted.delete('{}')
  end

  private

  def activity_debts
    @activities.map do |act|
      act.participants.keys.map { |name| { name => act.debts(name) } }
    end.flatten
  end

  def extract_and_merge
    result = {}
    activity_debts.each do |item|
      result.merge!(item) { |_key, old_v, new_v| old_v + new_v }
    end
    result
  end
end
