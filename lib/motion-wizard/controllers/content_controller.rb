module MotionWizard
  module ContentController
    extend Forwardable

    attr_reader :wizard_view_controller
    delegate :@wizard_view_controller, :next, :previous, :go_to_step, :wizard_data, :reset!, :finish

    def viewDidLoad
      super
      self.view.clipsToBounds = true
    end

    def wizard_view_controller=(wizard_view_controller)
      @wizard_view_controller = WeakRef.new(wizard_view_controller)
    end
  end
end