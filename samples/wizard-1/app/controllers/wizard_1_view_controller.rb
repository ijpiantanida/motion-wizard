class Wizard1ViewController < MotionWizard::WizardViewController
  steps Step1ViewController,
        Step2ViewController,
        Step3ViewController,
        Step4ViewController

  stylesheet :wizard_view_controller

  layout :wizard_view_controller

  def setup_index_item_at(index_item, index)
    layout(index_item, :index_item)
    index_item.when_selected{ index_item.animate_to_stylename(:index_item_selected) }
    index_item.when_unselected do
      UIView.animateWithDuration(0.5,
                                 animations: -> {
                                   layout(index_item, :index_item)
                                 }, completion: ->(_){
                                    layout(index_item, :index_item_unselected)
          })

    end
  end

  def when_finished
    App.alert("Now you can do whatever you like with this #{wizard_data}")
  end
end