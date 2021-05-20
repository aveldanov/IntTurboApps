

import UIKit

public class Manager {
    public init(){}
    
    public func viewControllerFrame() -> UIViewController {
        let bundle = Bundle(for: MyViewController.self)
        let vc = MyViewController(nibName: "MyViewController", bundle: bundle)
        return vc
    }
}
