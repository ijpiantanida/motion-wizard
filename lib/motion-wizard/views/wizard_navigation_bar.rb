module MotionWizard
  class WizardNavigationBar < UIView
    class IndexItem < UIView
      attr_reader :label
      def init
        super
        @label = UILabel.alloc.init
        @label.origin = [0,0]
        addSubview(@label)
        self
      end
    end

    def initWitNumberOfSteps(number_of_steps)
      self.init
      @number_of_steps = number_of_steps
      @index_items = []
      initialize_index_items
      self
    end

    def initialize_index_items
      @number_of_steps.times do |i|
        index_item = IndexItem.alloc.init
        addSubview(index_item)
        index_item.label.text = "%02d" % (i+1)
        @index_items << index_item
      end
    end

    def when_step_selected(&block)
      @when_step_selected = block
    end

    def when_step_unselected(&block)
      @when_step_unselected = block
    end

    def select(index)
      @when_step_unselected.call(@index_items[@selected_step]) if @selected_step && @when_step_unselected
      @selected_step = index
      @when_step_selected.call(@index_items[@selected_step]) if @selected_step && @when_step_selected
    end

    def setFrame(frame)
      super
      resize_indexes
    end

    def resize_indexes
      return unless @number_of_steps
      index_width = self.frame.size.width / @number_of_steps
      @index_items.each_with_index do |index_item, i|
        index_item.frame = [[index_width*i, 0], [index_width, self.size.height]]
        index_item_resized_at(index_item, i)
      end
    end

    def index_item_resized_at(index_item, i)
      index_item.label.size = index_item.size
    end
  end
end