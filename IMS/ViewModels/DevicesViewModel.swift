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
                
                let deviceUID = data["deviceUID"] as? String ?? ""
                let deviceID = data["deviceID"] as? String ?? ""
                let deviceModel = data["deviceModel"] as? String ?? ""
                let deviceManufacturer = data["deviceManufacturer"] as? String ?? ""
                let deviceOS = data["deviceOS"] as? String ?? ""
                let deviceSerialNumber = data["deviceSerialNumber"] as? String ?? ""
                let deviceModelNumber = data["deviceModelNumber"] as? String ?? ""
                let deviceVersion = data["deviceVersion"] as? String ?? ""
                let inStock = data["inStock"] as? Bool ?? false
                let lastModified = data["lastModified"] as? String ?? ""
                let modifiedBy = data["modifiedBy"] as? String ?? ""
                let note = data["note"] as? String ?? ""
                
                return Device(
                    deviceUID: deviceUID,
                    deviceID: deviceID,
                    deviceModel: deviceModel,
                    deviceManufacturer: deviceManufacturer,
                    deviceOS: deviceOS,
                    deviceSerialNumber: deviceSerialNumber,
                    deviceModelNumber: deviceModelNumber,
                    deviceVersion: deviceVersion,
                    inStock: inStock,
                    lastModified: lastModified,
                    modifiedBy: modifiedBy,
                    note: note)

            }
        }
    }
    
    // function: changes device status to checked out
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
    
    // function: changes device status to instock
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
    
    // function: updates entire document
    //TODO: update function to update all fields entered
    func updateData(deviceID: String, deviceModel: String, deviceSerial: String, note: String, inStock: Bool){
        
        let deviceData: [String: Any] = [
            "deviceModel" : deviceModel,
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
    
    // function: Add new device to firestore
    
    func addNewDevice(
        deviceUID: String,
        deviceModel: String,
        deviceManufacturer: String,
        deviceSerialNumber: String,
        deviceModelNumber: String,
        deviceOS: String,
        deviceVersion: String,
        note: String) {
        
        let deviceID = deviceModel + " - " + deviceSerialNumber
        
        let deviceData: [String: Any] = [
            // get device ID
            "deviceUID" : deviceUID,
            "deviceID" : deviceID,
            "deviceModel" : deviceModel,
            "deviceManufacturer" : deviceManufacturer,
            "deviceSerialNumber" : deviceSerialNumber,
            "deviceModelNumber" : deviceModelNumber,
            "deviceOS" : deviceOS,
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
