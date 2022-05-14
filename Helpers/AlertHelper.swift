//
//  AlertHelper.swift
//  Filmora
//
//  Created by Mustafa Pekdemir on 27.04.2022.
//

import UIKit

open class AlertHelper {
    static let sharedInstance = AlertHelper()
    
    fileprivate func topMostController() -> UIViewController? {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        var presentedVC = keyWindow?.rootViewController
        while let pVC = presentedVC?.presentedViewController
        {
            presentedVC = pVC
        }
        
        if presentedVC == nil {
            print("VLAlertController Error: There are no views configured for you. You may look at the viewDidLoad or viewDidAppear.")
        }
        return presentedVC
    }
    
    @discardableResult
    open class func alert(_ title: String) -> UIAlertController {
        return alert(title, message: "", buttonTitle: "")
    }
    
    @discardableResult
    open class func alert(_ title: String, message: String, buttonTitle: String) -> UIAlertController {
        return alert(title, message: message, acceptMessage: buttonTitle, acceptBlock: {
            // Do nothing
        })
    }
    
    @discardableResult
    open class func alert(_ title: String, message: String, acceptMessage: String, acceptBlock: @escaping () -> ()) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let acceptButton = UIAlertAction(title: acceptMessage, style: .default, handler: { (action: UIAlertAction) in
            acceptBlock()
        })
        alert.addAction(acceptButton)
        
        sharedInstance.topMostController()?.present(alert, animated: true, completion: nil)
        return alert
    }
    
    @discardableResult
    open class func alert(_ title: String, message: String, buttons:[String], tapBlock:((UIAlertAction,Int) -> Void)?) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert, buttons: buttons, tapBlock: tapBlock)
        sharedInstance.topMostController()?.present(alert, animated: true, completion: nil)
        return alert
    }
    
    @discardableResult
    open class func actionSheet(_ title: String, message: String, sourceView: UIView, actions: [UIAlertAction]) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.actionSheet)
        for action in actions {
            alert.addAction(action)
        }
        alert.popoverPresentationController?.sourceView = sourceView
        alert.popoverPresentationController?.sourceRect = sourceView.bounds
        sharedInstance.topMostController()?.present(alert, animated: true, completion: nil)
        return alert
    }
    
    @discardableResult
    open class func actionSheet(_ title: String, message: String, sourceView: UIView, buttons:[String], tapBlock:((UIAlertAction,Int) -> Void)?) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.actionSheet, buttons: buttons, tapBlock: tapBlock)
        alert.popoverPresentationController?.sourceView = sourceView
        alert.popoverPresentationController?.sourceRect = sourceView.bounds
        sharedInstance.topMostController()?.present(alert, animated: true, completion: nil)
        return alert
    }
}

private extension UIAlertController {
    convenience init(title: String?, message: String?, preferredStyle: UIAlertController.Style, buttons:[String], tapBlock:((UIAlertAction,Int) -> Void)?) {
        self.init(title: title, message: message, preferredStyle:preferredStyle)
        var buttonIndex = 0
        for buttonTitle in buttons {
            let action = UIAlertAction(title: buttonTitle, preferredStyle: .default, buttonIndex: buttonIndex, tapBlock: tapBlock)
            buttonIndex += 1
            self.addAction(action)
        }
    }
}

private extension UIAlertAction {
    convenience init(title: String?, preferredStyle: UIAlertAction.Style, buttonIndex:Int, tapBlock:((UIAlertAction,Int) -> Void)?) {
        self.init(title: title, style: preferredStyle) {
            (action:UIAlertAction) in
            if let block = tapBlock {
                block(action,buttonIndex)
            }
        }
    }
}
