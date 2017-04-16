//
//  EventDetailsViewController.swift
//  MySampleApp
//
//  Created by André on 16/04/2017.
//
//

import UIKit

class EventDetailsViewController: UIViewController {

    
    @IBAction func goToMaps(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Map", bundle: nil)
        let viewController2 = storyboard.instantiateViewController(withIdentifier: "Map") as! MapViewController
        viewController2.coordinates = "2,2"
        self.present(viewController2, animated: true, completion: nil)
        
    }
    @IBAction func backToMainView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
