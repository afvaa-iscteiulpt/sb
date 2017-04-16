//
//  AppTutorialViewController.swift
//  MySampleApp
//
//  Created by André on 15/04/2017.
//
//
// APP TUTORIAL AND SIGN IN SEGMENTS
/*
NEXT STEPS:
 - criar page de login na ultima page
 - falar com o joão para ver como deve ficar o tutorial
*/

import UIKit

class AppTutorialViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var labelTutorial: UILabel!
    @IBOutlet weak var pageControlTutorial: UIPageControl!
    var counterPage = 0
    
    var from: String = ""
    
    var typeSwap = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(from == "inside") {
            
            //put back button
            self.backButton.isHidden = false
            self.backButton.addTarget(self, action: #selector(self.backToMainView), for: .touchUpInside)
            
            //change pagecontrol width
            pageControlTutorial.numberOfPages = pageControlTutorial.numberOfPages-1
        }
 
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(AppTutorialViewController.handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(AppTutorialViewController.handleSwipes(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        labelTutorial.text = "Page " + String(counterPage)
    }
    
    func backToMainView(_ sender:Any) {
        print("back to main view")
        self.dismiss(animated: true, completion: nil)
    }
    
    func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .right) {
            print("Swipe Right")
            
            if(counterPage != 0) {
                counterPage-=1
                pageControlTutorial.currentPage = counterPage
                
                typeSwap = "back"
                
                self.changeViewContent()
            }
            
        }
        
        if (sender.direction == .left) {
            
            print("Swipe Left")
      
            if(counterPage != pageControlTutorial.numberOfPages-1) {
                counterPage+=1
                pageControlTutorial.currentPage = counterPage
                
                typeSwap = "front"
                
                self.changeViewContent()
            }
        }
    }
    
    func changeViewContent() {
        
        switch counterPage {
            case 0:
                stepZero()
            case 1:
                stepOne()
            case 2:
                stepTwo()
            case 3:
                stepThree()
            case 4:
                stepFour()
            default:
                print("cannot happen")
            }

        labelTutorial.text = "Page " + String(counterPage)
    }
    
    func stepZero() {
        if(typeSwap == "front") {
            print("Step 0 front")
        } else {
            print("Step 0 back")
        }
    }
    
    func stepOne() {
        if(typeSwap == "front") {
            print("Step 1 front")
        } else {
            print("Step 1 back")
        }
    }
    
    func stepTwo() {
        if(typeSwap == "front") {
            print("Step 2 front")
        } else {
            print("Step 2 back")
        }
    }
    
    func stepThree() {
        if(typeSwap == "front") {
            print("Step 3 front")
        } else {
            print("Step 3 back")
            //never happens
        }
    }
    
    func stepFour() {
        if(typeSwap == "front") {
            print("Step 4 front")

            //show content login
            counterPage-=1
            pageControlTutorial.currentPage = counterPage
            
            let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "SignIn") as! SignInViewController
            viewController.tutorial = true
            self.present(viewController, animated: true, completion: nil)
            
        } else {
            print("Step 4 back")
        }
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
