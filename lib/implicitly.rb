class Module
  # Set up the implicit handling. Use the #from #to and #via methods to specify
  # the full transformation. For example:
  #
  #    implicit.from(Fixnum).to(FixnumWithTime).via {|number| FixnumWithTime.new(number) }
  #
  # Nothing takes effect until all three (#from #to and #via) are set.
  #
  # The above implicit will transform a Fixnum instance into a FixnumWithTime
  # wrapper, but only when you call a public instance method which is defined
  # in FixnumWithTime.
  def implicitly
    Implicit.new
  end
end

class Implicit
  # Set the base of the implicit wrapping. This should be an existing class.
  def from(starting_class)
    @starting_class = starting_class
    try_to_do_everything
    self
  end

  # Set the wrapper class. This class must have a constructor which takes one
  # argument, which is an instance of the base class.
  def to(ending_class)
    @ending_class = ending_class
    try_to_do_everything
    self
  end

  # Set the transformer. This is a Proc which takes an instance of the base
  # class and produces an instance of the wrapper class.
  def via(&transformer)
    @transformer = transformer
    try_to_do_everything
    self
  end

  def try_to_do_everything
    if !@starting_class.nil? && !@ending_class.nil? && !@transformer.nil?
      transformer = @transformer
      (@ending_class.instance_methods - Object.instance_methods).each do |meth_name|
        @starting_class.class_eval do
          define_method(meth_name) do |*args|
            transformer.call(self).send(meth_name,*args)
          end
        end
      end
    end
  end
  private :try_to_do_everything
end
