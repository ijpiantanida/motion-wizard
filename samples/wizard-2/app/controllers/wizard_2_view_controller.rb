class Wizard2ViewController< MotionWizard::WizardViewController
  steps Step1ViewController,
        Step2ViewController,
        Step2ViewController,
        Step2ViewController,
        Step3ViewController

  index_item_view_class MyCustomIndexItemView

  stylesheet :wizard_view_controller
  layout :wizard_view_controller

  def index_item_added_to_view_at(index_item, index)
    index_item.label.text = case index
                              when 0..2
                                "I"*(index + 1)
                              when 3
                                "IV"
                              when 4
                                "V"
                            end
    index_item.restyle!
  end

  def when_finished
    self.go_to_step(0)
    self.reset!
  end
end