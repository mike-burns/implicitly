require 'test/unit'
require 'implicitly'

class FixnumWithTime
  def initialize(n)
    @n = n
  end

  def minutes
    seconds * 60
  end

  def hours
    minutes * 60
  end

  def seconds
    @n
  end
end

class ImplicitlyTest < Test::Unit::TestCase
  implicitly.from(Fixnum).to(FixnumWithTime).via {|n| FixnumWithTime.new(n) }

  def test_fixnum_with_time
    assert_equal 120, 2.minutes
    assert_equal 7200, 2.hours
    assert_equal 2, 2.seconds
  end

  def test_fixnum_with_time_delegation
    assert !2.minutes.zero?
  end
end

# TODO:
#class UnimplicitlyTest < Test::Unit::TestCase
#  def test_fixnum_sans_time
#    assert_raise(NoMethodError) do
#      2.minutes
#    end
#  end
#end
