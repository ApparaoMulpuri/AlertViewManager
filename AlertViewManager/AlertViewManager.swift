//
//  AlertViewManager
//  AlertViewManager
//
//  Created by Appa Rao Mulpuri on 12/11/17.
//  Copyright © 2017 Appa Rao Mulpuri. All rights reserved.
//


import UIKit

struct AlertControllerInfo {
    var presentingVC : UIViewController
    var alertController : UIAlertController
}

public class AlertViewManager : NSObject {
    
    public class var defaultManager : AlertViewManager {
        struct Static {
            static let instance : AlertViewManager = AlertViewManager()
        }
        return Static.instance
    }
    
    fileprivate var alertCtrls = [AlertControllerInfo]()
    
    //Displays Alert Message with the OK button
    public func showOkAlert(_ title: String?, message: String?, handler: ((UIAlertAction) -> Void)?) {
        let okAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel, handler: handler)
        
        self.showAlert(title, message: message, actions: [okAction], style: UIAlertControllerStyle.alert, view: nil)
    }
    
    //Displays Alert Message from the ERROR object
    public func showErrorAlert(error: Error) {
        if error._code == NSURLErrorNotConnectedToInternet {
            self.showOfflineAlert()
        } else {
            self.showOkAlert("Error!", message: error.localizedDescription, handler: nil)
        }
    }
    
    //Displays Logout Alert Message
    public func showLogoutAlert() {
        AlertViewManager.defaultManager.showOkAlert("User Logout!", message: "Someone has used your credentials to login into HealthePets. Please click on OK to login again.") { (response) in
            //Do your custom actions here
        }
    }

    //Displays OFFLINE Alert Message
    public func showOfflineAlert() {
        let dismissAction = UIAlertAction.init(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: nil)
        let alertController = UIAlertController(title: "Error!", message: "Device is offline. Please check the network connection and try again.", preferredStyle: .alert)
        alertController.addAction(dismissAction)
        
        if let presentingViewController = UIApplication.shared.keyWindow?.rootViewController {
            if let presentedModalVC = presentingViewController.presentedViewController {
                presentedModalVC.present(alertController, animated: true, completion: nil)
            }
            else {
                presentingViewController.present(alertController, animated: true, completion: nil)
            }
        }
        
        // change to desired number of seconds (in this case 3 seconds)
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when){
            alertController.dismiss(animated: true, completion: nil)
        }
    }

    //Dismisses all alerts
    func cancelAllAlerts() {
        for alertCtrl in alertCtrls {
            if alertCtrl.alertController.presentingViewController != nil {
                alertCtrl.presentingVC.dismiss(animated: false, completion: {
                    
                    if let index = self.findAlertController(alertCtrl.alertController) {
                        self.alertCtrls.remove(at: index)
                    }
                })
            } else {
                 self.alertCtrls.remove(at: self.findAlertController(alertCtrl.alertController)!)
            }
        }
    }
    
    fileprivate func showActions(_ title: String?, message: String?, actions: [UIAlertAction], view: AnyObject) {
        self.showAlert(title, message: message, actions: actions, style: UIAlertControllerStyle.actionSheet, view: view)
    }
    
    fileprivate func showAlert(_ title: String?, message: String?, actions: [UIAlertAction]) {
        self.showAlert(title, message: message, actions: actions, style: UIAlertControllerStyle.alert, view: nil)
    }

    fileprivate func showAlert(_ title: String?, message: String?, actions: [UIAlertAction], style: UIAlertControllerStyle, view: AnyObject?) {
        
        let alertController = UIAlertController.init(title: title, message: message == "" ? nil : message, preferredStyle: style) as UIAlertController
        
        for action: UIAlertAction in actions {
            alertController.addAction(action)
        }
        
        if let app = UIApplication.shared.delegate, let window = app.window, let presentingViewController = window?.rootViewController {
            
            let popOverPresentationVC = alertController.popoverPresentationController
            
            if let popover = popOverPresentationVC {
                if let view = view as? UIBarButtonItem {
                    popover.barButtonItem = view
                }
                else if let view = view as? UIView {
                    popover.sourceView = view;
                    popOverPresentationVC?.sourceRect = view.bounds;
                } else {
                    popOverPresentationVC?.sourceView = presentingViewController.view;
                    popOverPresentationVC?.sourceRect = presentingViewController.view.bounds;
                }
                
                popOverPresentationVC?.permittedArrowDirections = UIPopoverArrowDirection.any;
            }
            
            self.presentAlertController(alertController, presentingViewController: presentingViewController)
        }
    }
    
    fileprivate func showAlertWithController(_ alertController : UIAlertController) {
        if let presentingViewController = UIApplication.shared.keyWindow?.rootViewController?.presentedViewController {
            self.presentAlertController(alertController, presentingViewController: presentingViewController)
        }
    }
    
    fileprivate func presentAlertController(_ alertController : UIAlertController, presentingViewController : UIViewController) {
        DispatchQueue.main.async { () -> Void in
            
            // Handle modal VC scenarios
            if let presentedModalVC = presentingViewController.presentedViewController {
                presentedModalVC.present(alertController, animated: true, completion: nil)
                self.alertCtrls.append(AlertControllerInfo(presentingVC:presentedModalVC, alertController: alertController))
            }
            else {
                presentingViewController.present(alertController, animated: true, completion: nil)
                self.alertCtrls.append(AlertControllerInfo(presentingVC:presentingViewController, alertController: alertController))
            }
        }
    }
    
    fileprivate func findAlertController(_ alertCtrl: UIAlertController) -> Int? {
        for i in 0..<alertCtrls.count {
            if alertCtrls[i].alertController == alertCtrl {
                return i
            }
        }
        return nil
    }
}
