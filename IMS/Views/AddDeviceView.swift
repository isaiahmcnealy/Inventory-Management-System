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
    
    @State var deviceName: String = ""
    @State var deviceSerialNumber: String = ""
    @State var note: String = ""
    
    var body: some View {

        VStack{
            Text("Add Device")
                .font(.title)
        
            Form {
                
                Section(header: Text("Add Device")){
                    TextField("Device Name", text: $deviceName)
                    TextField("Device Serial #", text: $deviceSerialNumber)
                    TextField("Note", text: $note)
                }
                
                Section {
                    Button("Add Device", action: btnAddDevice)
                }
            }
        }
        
    }
    
    func btnAddDevice() {
    
        // check if text fields are empty
        if (deviceName == "" || deviceSerialNumber == ""){
            print("Error: Device name and serial number are required. Please try again")
            return
        } else {
            self.viewModel.addNewDevice(deviceName: deviceName, deviceSerial: deviceSerialNumber, note: note)
            // clear fields
            deviceName = ""
            deviceSerialNumber = ""
            note = ""
        }
    }

}

struct AddDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        AddDeviceView()
    }
}
