//
//  ViewController.swift
//  Music-link-replacer
//
//  Created by uuttff8 on 17/02/2019.
//  Copyright © 2019 uuttff8. All rights reserved.
//


import UIKit
import AudioToolbox

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Properties    
    /// Main TextField place
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /// dismiss keyboard on Done button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func converButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Convert to...", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "All services", style: .default, handler: { _ in
            
            let link = self.allServices()
            
            if !link.contains(".com") {
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                let alertNotLink = UIAlertController(title: "it is not link", message: nil, preferredStyle: .alert)
                alertNotLink.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alertNotLink, animated: true, completion: nil)
                
            } else {
                self.copyLink(link)
            }
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func allServices() -> String {
        let link = "https://song.link/redirect?url=\(myTextField.text!)"

        return link
    }
    
    func copyLink(_ link: String) {
        UIPasteboard.general.string = link
    }
}
