//
//  MainViewController.swift
//  SharePhotoApp
//
//  Created by Ahmet GÜVENDİK on 14.03.2023.
//

import UIKit
import Firebase
import SDWebImage

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getDataFromFirebase()
        // Do any additional setup after loading the view.
    }
    
    var postArray = [Post]()
    
    func getDataFromFirebase(){
        let firebaseDb = Firestore.firestore()
        firebaseDb.collection("Post").order(by: "tarih",descending: true) //siralama yapmak icin
            .addSnapshotListener { query, error in
                if error != nil {
                    print(error?.localizedDescription)
                } else{
                    if query?.isEmpty != true && query != nil{
                        self.postArray.removeAll(keepingCapacity: false)
                        for datas in query!.documents {
                            if let email =  datas.get("email") as? String {
                                if let image =  datas.get("gorselUrl") as? String {
                                    if let note =  datas.get("yorum") as? String {
                                        let post = Post(email: email, gorselUrl: image, note: note)
                                        self.postArray.append(post)
                                    }
                                    
                                }
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
                
            }
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellTable", for: indexPath) as! TableViewCell
        cell.emailLabel.text = self.postArray[indexPath.row].email
        cell.PostimageView.sd_setImage(with: URL(string: self.postArray[indexPath.row].gorselUrl))
        cell.noteLabel.text = postArray[indexPath.row].note
        return cell
    }
}
