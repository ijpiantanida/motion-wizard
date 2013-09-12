class Wizard1ViewController < MotionWizard::WizardViewController
  steps Step1ViewController,
        Step2ViewController

  def create_index_item_at(index)
    index_item = super
    original_label_text = index_item.label.text
    index_item.when_selected{index_item.label.text = "*"}
    index_item.when_unselected{index_item.label.text = original_label_text}
    index_item
  end
end