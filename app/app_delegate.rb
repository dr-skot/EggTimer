class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    @viewController = EggTimerController.alloc.initWithNibName(nil, bundle:nil)
    @window.rootViewController = @viewController
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
  end
end
