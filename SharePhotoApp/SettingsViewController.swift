//
//  SettingsViewController.swift
//  SharePhotoApp
//
//  Created by Ahmet GÜVENDİK on 14.03.2023.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    @IBAction func signOutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toSignPage", sender: nil)
        } catch {
            print("Hata")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
