//
//  UploadViewController.swift
//  SharePhotoApp
//
//  Created by Ahmet GÜVENDİK on 14.03.2023.
//

import UIKit
import FirebaseStorage
import Firebase

class UploadViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var notetextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    let storage = Storage.storage()
    @IBAction func saveButton(_ sender: Any) {
        
        let storage = Storage.storage()
        
        let storageReferance = storage.reference()
        
        let mediaFolder = storageReferance.child("Media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            let uuid = UUID().uuidString
            let imageReferance = mediaFolder.child("\(uuid).jpg")
            imageReferance.putData(data) { StorageMetadata, Error in
                if Error == nil {
                    imageReferance.downloadURL { url, error in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            if let imageUrl = imageUrl {
                                let firebaseDb = Firestore.firestore()
                                let currentUser = Auth.auth().currentUser?.email
                                let post = ["gorselUrl": imageUrl,"yorum": self.notetextField.text ?? "", "email": currentUser,"tarih": FieldValue.serverTimestamp()] as [String : Any]
                                firebaseDb.collection("Post").addDocument(data: post) { error in
                                    if error != nil {
                                        print(error?.localizedDescription)
                                    }else{
                                        self.imageView.image = UIImage(named: "harita")
                                        self.notetextField.text = ""
                                        self.tabBarController?.selectedIndex = 0
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        }
            

        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            let gestureImage = UITapGestureRecognizer(target: self, action: #selector(pickImage))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(gestureImage)
        }
        
        @objc func pickImage(){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            present(picker, animated: true)
            
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            self.dismiss(animated: true)
        }
        
    }

    



