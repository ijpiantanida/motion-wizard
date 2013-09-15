class Wizard1ViewController < MotionWizard::WizardViewController
  steps Step1ViewController,
        Step2ViewController,
        Step3ViewController,
        Step4ViewController

  stylesheet :wizard_view_controller

  layout :wizard_view_controller

  def index_item_added_to_view_at(index_item, index)
    layout(index_item, :index_item)
    index_item.when_selected do
      UIView.animateWithDuration(0.5,
                                 animations: -> {
                                   layout(index_item, :index_item_selected)
                                 })
    end
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
    App.alert("Now you can do whatever you like with this #{@wizard_data}.\nLike changing views...")
  end
end