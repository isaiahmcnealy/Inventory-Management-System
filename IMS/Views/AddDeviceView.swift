//
//  AddDeviceView.swift
//  IMS
//
//  Created by Isaiah McNealy on 7/4/22.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct AddDeviceView: View {
    
    // create reference to Device view model
    @ObservedObject private var viewModel = DevicesViewModel()
    
    @State var deviceModel: String = ""
    @State var deviceManufacturer: String = ""
    @State var deviceOS: String = ""
    @State var deviceVersion: String = ""
    @State var deviceSerialNumber: String = ""
    @State var deviceModelNumber: String = ""
    @State var note: String = ""
    
    @State var presentAlert = false
    
    
    var body: some View {

        VStack{
            Text("Add Device")
                .font(.title)
        
            Form {
                
                Section(header: Text("Add Device")){
                    TextField("Device Model: iPhone 13 Pro", text: $deviceModel)
                    TextField("Device Manufacturer: Apple", text: $deviceManufacturer)
                    TextField("Device Serial #", text: $deviceSerialNumber)
                    TextField("Device Model #", text: $deviceModelNumber)
                    TextField("Device OS: iOS", text: $deviceOS)
                    TextField("OS Version: 1234", text: $deviceVersion)
                    TextField("Note", text: $note)
                }
        
                Section {
                    Button("Add Device") {
                        btnAddDevice()
                    }
                    .alert("Important message", isPresented: $presentAlert) {
                        Button("OK", role: .cancel) { }
                    }
                }
            }
        }
    }
    
    func btnAddDevice() {
        
        // check if text fields are empty
        if (deviceModel == "" || deviceManufacturer == "" || deviceVersion == "" || deviceOS == ""){
            print("Error: Device model, serial manufacturer, device operating system and OS version are required. Please try again")
            presentAlert = true
            return
        } else {
            self.viewModel.addNewDevice(
                deviceUID: UUID().uuidString,
                deviceModel: deviceModel,
                deviceManufacturer: deviceManufacturer,
                deviceSerialNumber: deviceSerialNumber,
                deviceModelNumber: deviceModelNumber,
                deviceOS: deviceOS,
                deviceVersion: deviceVersion,
                note: note
            )
            
            // clear fields
            deviceModel = ""
            deviceManufacturer = ""
            deviceModelNumber = ""
            deviceSerialNumber = ""
            deviceOS = ""
            deviceVersion = ""
            note = ""
        }
    }
}

struct AddDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeviceView()
    }
}
