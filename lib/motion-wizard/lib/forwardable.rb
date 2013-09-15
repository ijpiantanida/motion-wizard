module MotionWizard
  module Forwardable
    def delegate(*methods)
      to = methods.shift
      methods.each do |method_name|
        define_method(method_name) do |*args, &block|
          self.instance_variable_get(to).send(method_name, *args, &block)
        end
      end
    end
  end
end