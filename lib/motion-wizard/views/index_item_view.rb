module MotionWizard
  class IndexItem < UIView
    attr_reader :label, :label_wrapper

    def init
      super
      create_label
      create_label_wrapper
      @label_wrapper.addSubview(@label)
      addSubview(@label_wrapper)

      initialize_callbacks
      self
    end

    def create_label
      @label               = UILabel.alloc.init
      @label.textAlignment = NSTextAlignmentCenter
      @label.origin        = [0, 0]
    end

    def create_label_wrapper
      @label_wrapper                 = UIView.alloc.init
      @label_wrapper.origin          = [0, 0]
      @label_wrapper.backgroundColor = UIColor.clearColor
    end

    def initialize_callbacks
      when_selected do
        @original_text = @label.text
        @label.text = "[#{@label.text}]"
      end

      when_unselected { @label.text = @original_text}
    end

    def when_selected(&block)
      @when_selected = block
    end

    def when_unselected(&block)
      @when_unselected = block
    end

    def select
      @when_selected.call
    end

    def unselect
      @when_unselected.call
    end
  end
end