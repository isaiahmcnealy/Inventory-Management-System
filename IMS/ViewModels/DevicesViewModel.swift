//
//  DevicesViewModel.swift
//  IMS
//
//  Created by Isaiah McNealy on 7/5/22.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class DevicesViewModel: ObservableObject {
    @Published var devices = [Device]()
    
    // get default firestore instance
    private var db = Firestore.firestore()
    
    // gets list of devices
    func fetchData(){
        db.collection("devices").addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("no documents found")
                return
            }
            
            self.devices = documents.map { (QueryDocumentSnapshot) -> Device in
                let data = QueryDocumentSnapshot.data()
                
                let deviceID = data["deviceID"] as? String ?? ""
                let deviceName = data["deviceName"] as? String ?? ""
                let deviceSerialNumber = data["deviceSerialNumber"] as? String ?? ""
                let deviceVersion = data["deviceVersion"] as? String ?? ""
                let inStock = data["inStock"] as? Bool ?? false
                let lastModified = data["lastModified"] as? String ?? ""
                let modifiedBy = data["modifiedBy"] as? String ?? ""
                let note = data["note"] as? String ?? ""
                
                return Device(deviceID: deviceID, deviceName: deviceName, deviceSerialNumber: deviceSerialNumber, deviceVersion: deviceVersion, inStock: inStock, lastModified: lastModified, modifiedBy: modifiedBy, note: note)

            }
        }
    }
    
    
    func checkoutDevice(deviceID: String) {
        db.collection("devices").document(deviceID).updateData([
            "inStock" : false,
            "lastModified" : getCurrentTime()
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    func returnDevice(deviceID: String) {
        db.collection("devices").document(deviceID).updateData([
            "inStock" : true,
            "lastModified" : getCurrentTime()
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    // updates existing device information
    func updateData(deviceID: String, deviceName: String, deviceSerial: String, note: String, inStock: Bool){
        
        let deviceData: [String: Any] = [
            "deviceName" : deviceName,
            "deviceSerialNumber" : deviceSerial,
            "inStock" : inStock,
            "lastModified" : getCurrentTime(),
            "modifiedBy" : "Isaiah McNealy",
            "note" : note
        ]
    
        db.collection("devices").document(deviceID).setData(deviceData){ error in
            if let error = error {
                print("Error: there was a problem adding new device - \(error)")
            } else {
                // log that devices were added
                print("Device Successfully Added\nDevice: \(deviceData)")
            }
        }
    }
    
    /**
     * Function adds new device to firestore
     */
    func addNewDevice(deviceID: String, deviceName: String, deviceSerial: String, note: String, deviceVersion: String) {
        
        let deviceData: [String: Any] = [
            // get device ID
            "deviceID" : deviceID,
            "deviceName" : deviceName,
            "deviceSerialNumber" : deviceSerial,
            "deviceVersion" : deviceVersion,
            "inStock" : true,
            "lastModified" : getCurrentTime(),
            "modifiedBy" : "Isaiah McNealy",
            "note" : note
            
        ]
        
        
        // Add a new document in collection "cities"
        db.collection("devices").document(deviceID).setData(deviceData) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
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
