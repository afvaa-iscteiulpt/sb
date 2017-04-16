//
//  AccountSettingsViewController.swift
//  MySampleApp
//
//  Created by André on 16/04/2017.
//
//

import Foundation
import UIKit
import AWSMobileHubHelper

class AccountSettingsViewController: UIViewController {
    
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var userID: UILabel!
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        logoutButton.addTarget(self, action: #selector(self.handleLogout), for: .touchUpInside)

        let identityManager = AWSIdentityManager.default()
        
        if let identityUserName = identityManager.identityProfile?.userName {
            userName.text = identityUserName
        } else {
            userName.text = NSLocalizedString("Guest User", comment: "Placeholder text for the guest user.")
        }
        
        userID.text = identityManager.identityId
        if let imageURL = identityManager.identityProfile?.imageURL {
            let imageData = try! Data(contentsOf: imageURL)
            if let profileImage = UIImage(data: imageData) {
                userImageView.image = profileImage
            } else {
                userImageView.image = UIImage(named: "UserIcon")
            }
        }
   
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleLogout() {
        if (AWSSignInManager.sharedInstance().isLoggedIn) {
            
            AWSSignInManager.sharedInstance().logout(completionHandler: {(result: Any?, authState: AWSIdentityManagerAuthState, error: Error?) in
            
                self.dismiss(animated: true, completion: nil)
            })

        } else {
            
        }
    }
}
