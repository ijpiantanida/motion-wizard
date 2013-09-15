class AppDelegate
  def application(application, didFinishLaunchingWithOptions: launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = Wizard2ViewController.alloc.init
    @window.makeKeyAndVisible

    application.statusBarStyle =  UIStatusBarStyleLightContent if UIDevice.currentDevice.systemVersion.to_f >= 7
    true
  end
end
