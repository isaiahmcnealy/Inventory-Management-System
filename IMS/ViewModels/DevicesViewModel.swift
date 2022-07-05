//
//  DevicesViewModel.swift
//  IMS
//
//  Created by Isaiah McNealy on 7/5/22.
//

import Foundation
import FirebaseFirestore

class DevicesViewModel: ObservableObject {
    @Published var devices = [Device]()
    
    // get default firestore instance
    private var db = Firestore.firestore()
    
    func fetchData(){
        db.collection("devices").addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("no documents found")
                return
            }
            
            self.devices = documents.map { (QueryDocumentSnapshot) -> Device in
                let data = QueryDocumentSnapshot.data()
                
                let deviceName = data["deviceName"] as? String ?? ""
                let deviceSerialNumber = data["deviceSerialNumber"] as? String ?? ""
                let inStock = data["inStock"] as? Bool ?? false
                let lastModified = data["lastModified"] as? String ?? ""
                let modifiedBy = data["modifiedBy"] as? String ?? ""
                
                return Device(deviceName: deviceName, deviceSerialNumber: deviceSerialNumber, inStock: inStock, lastModified: lastModified, modifiedBy: modifiedBy)

            }
        }
    }
    
    func writeData(deviceName: String, deviceSerial: String){
        
        let deviceData: [String: Any] = [
            "deviceName" : deviceName,
            "deviceSerialNumber" : deviceSerial,
            "inStock" : true,
            "lastModified" : getCurrentTime(),
            "modifiedBy" : "Isaiah McNealy"
            
        ]
        
        db.collection("devices").document(deviceSerial).setData(deviceData){ error in
            if let error = error {
                print("Error: there was a problem adding new device - \(error)")
            } else {
                // log that devices were added
                print("Device Successfully Added\nDevice: \(deviceData)")
            }
        }
    }
    
    /**
     * Function returns current time
     */
    func getCurrentTime()->String{
        
        let time = Date()   // Get current date
        let dateFormatter = DateFormatter() // create a date formatter instance
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"   // set date format of formatter
        dateFormatter.timeZone = TimeZone(abbreviation: "EST")  // set time zone for date formatter
        let stringDate = dateFormatter.string(from: time)   // set current formatted date to string
        
        return stringDate   // return stringDate
    }
    
}
