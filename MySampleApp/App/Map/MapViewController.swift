//
//  MapViewController.swift
//  MySampleApp
//
//  Created by André on 16/04/2017.
//
//

import UIKit

class MapViewController: UIViewController {

    var coordinates = ""
    
   
    @IBAction func backEventsView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(coordinates)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
