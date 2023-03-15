//
//  Post.swift
//  SharePhotoApp
//
//  Created by Ahmet GÜVENDİK on 15.03.2023.
//

import Foundation

class Post {
    var email : String
    var gorselUrl : String
    var note: String
    
    init(email: String, gorselUrl: String, note: String) {
        self.email = email
        self.gorselUrl = gorselUrl
        self.note = note
    }
}
