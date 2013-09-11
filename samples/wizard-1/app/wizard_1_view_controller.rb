class Wizard1ViewController < MotionWizard::WizardViewController
  steps Step1ViewController,
        Step2ViewController

  layout size: App.frame.size, origin: [0,0]
end