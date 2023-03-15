//
//  ViewController.swift
//  SharePhotoApp
//
//  Created by Ahmet GÜVENDİK on 12.03.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var epostatextField: UITextField!
    
    @IBOutlet weak var passwordtextField: UITextField!
    
 
    @IBAction func button(_ sender: Any) {
        if epostatextField.text != "" && passwordtextField.text != ""{
            Auth.auth().signIn(withEmail: epostatextField.text ?? "", password: passwordtextField.text ?? "") { [weak self] authResult, error in
                if error == nil {
                    self!.performSegue(withIdentifier: "MainPageSegue", sender: nil)
                } else {
                    self!.errorAlert(error: error?.localizedDescription ?? "")
                }
            }
        }
        else {
            errorAlert(error: "Kullanici Adi ve ya Sifre Girmediniz")
        }
        
       
    }
    var alertController = UIAlertController()
   
    @IBAction func signUptextField(_ sender: Any) {
        if epostatextField.text != "" && passwordtextField.text != ""{
            Auth.auth().createUser(withEmail: epostatextField.text ?? "" , password: passwordtextField.text ?? "") { result, error in
                if error == nil {
                    self.succeedAlert()
                } else {
                    self.errorAlert(error: error?.localizedDescription ?? "")
                }
            }
        }
        else {
            errorAlert(error: "Kullanici Adi ve ya Sifre Girmediniz")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func errorAlert(error : String){
        alertController = UIAlertController(title: "Hata", message: error, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
    
    func succeedAlert(){
        alertController = UIAlertController(title: "Tebrikler", message: "Üyeliğiniz Başarılı Bir Şekilde Oluşturulmuştur", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }

}

