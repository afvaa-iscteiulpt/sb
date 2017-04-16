//
//  UserPoolSignUpConfirmationViewController.swift
//  MySampleApp
//
//
// Copyright 2017 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-swift v0.13
//
//

import Foundation
import UIKit
import AWSCognitoIdentityProvider
import AWSMobileHubHelper

class UserPoolSignUpConfirmationViewController : UIViewController {
    
    var sentTo: String?
    var user: AWSCognitoIdentityUser?
    
    @IBOutlet weak var codeSentTo: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var confirmationCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userName.text = self.user!.username;
    }
    
    @IBAction func onConfirm(_ sender: AnyObject) {
        guard let confirmationCodeValue = self.confirmationCode.text, !confirmationCodeValue.isEmpty else {
            let alert = UIAlertController(title: "Confirmation code missing.",
                                          message: "Please enter a valid confirmation code.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion:nil)
            return
        }
        
        self.user?.confirmSignUp(self.confirmationCode.text!, forceAliasCreation: true).continueWith(block: {[weak self] (task: AWSTask) -> AnyObject? in
            guard let strongSelf = self else { return nil }
            DispatchQueue.main.async(execute: { 
                if let error = task.error as? NSError {
                    let alert = UIAlertController(title: error.userInfo["__type"] as? String,
                                                  message:error.userInfo["message"] as? String,
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    strongSelf.present(alert, animated: true, completion:nil)
                
                } else {
                    let alert = UIAlertController(title: "Registration Complete",
                                                  message: "Registration was successful.",
                                                  preferredStyle: .alert)
                    //alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    strongSelf.present(alert, animated: true, completion:nil)
                    //_ = strongSelf.navigationController?.popToRootViewController(animated: true)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                        let presentationViewController = self?.presentingViewController
                        strongSelf.dismiss(animated: false, completion:
                            {
                            presentationViewController!.dismiss(animated: true, completion: nil)
                            })

                    }))
 
                }
            })
            return nil
        })
        
    }
    
    @IBAction func onResendConfirmationCode(_ sender: AnyObject) {
        self.user?.resendConfirmationCode().continueWith(block: {[weak self] (task: AWSTask<AWSCognitoIdentityUserResendConfirmationCodeResponse>) -> AnyObject? in
            guard let strongSelf = self else { return nil }
            DispatchQueue.main.async(execute: { 
                if let error = task.error as? NSError {
                    let alert = UIAlertController(title: error.userInfo["__type"] as? String,
                                                  message:error.userInfo["message"] as? String,
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    strongSelf.present(alert, animated: true, completion:nil)
                } else if let result = task.result as AWSCognitoIdentityUserResendConfirmationCodeResponse! {
                    let alert = UIAlertController(title: "Code Resent",
                                                  message: "Code resent to \(result.codeDeliveryDetails?.destination!)",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    strongSelf.present(alert, animated: true, completion:nil)
                }
            })
            return nil
        })
    }
    
    func dismissController() {
        self.dismiss(animated: true, completion: nil)
        //_ = self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func onCancel(_ sender: AnyObject) {
        self.dismissController()
    }
}
