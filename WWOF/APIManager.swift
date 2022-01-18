//
//  APIManager.swift
//  WWOF
//
//  Created by Roman on 16.01.2022.
//

import Foundation
import Firebase
import FirebaseAuth

struct Profile{
    let name: String
    let surname: String
}

func getUserInfo(uid: String, completion: @escaping (Profile?) -> Void) {

    let bd = Firestore.firestore()
    bd.collection("users").document(uid).getDocument(){ (document, error) in
        guard error == nil else {completion(nil); return}
        let name = document?.get("First name") as! String
        let surname = document?.get("Last name") as! String
        let profile = Profile(name: name, surname: surname)
        completion(profile)
    }
}

var userUId = String()
var profileData: [String: Any] = [:]
