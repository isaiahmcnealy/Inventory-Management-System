//
//  FirestoreManager.swift
//  IMS
//
//  Created by Isaiah McNealy on 7/5/22.
//

import Firebase

class FirestoreManager: ObservableObject {
    
    @Published var device:String = ""
    
    /**
     * func: fetches a single device
     */
    func getSingleDevice(deviceID: String){
        
        let db = Firestore.firestore()

        let docRef = db.collection("devices").document(deviceID)

        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }

            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("data", data)
                    self.device = data["name"] as? String ?? ""
                }
            }

        }
    }
    
    /**
     * function: fetches a devices in collection
     */
    func getAllDevices(){
        
        // create reference to firestore
        let db = Firestore.firestore()
        
        // create reference to device collection
        db.collection("devices")
            // retrieve all documents in collection
            .getDocuments() { (querySnapshot, err) in
                // handle errors
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    // print all devices recieved
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
        }
        
    }

    
    
    
    

}
