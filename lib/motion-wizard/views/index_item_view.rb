module MotionWizard
  class IndexItem < UIView
    attr_reader :label

    def init
      super
      @label = UILabel.alloc.init
      @label.textAlignment = NSTextAlignmentCenter
      @label.origin = [0,0]
      addSubview(@label)

      initialize_callbacks
      self
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