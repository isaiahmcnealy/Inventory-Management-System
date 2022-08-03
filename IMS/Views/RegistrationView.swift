//
//  RegistrationView.swift
//  IMS
//
//  Created by Isaiah McNealy on 7/5/22.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    var body: some View {
        
        Form{
            Section(header: Text("New User")){
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Complete Registration", action: registerNewUser)
            }
        }
    }
    
    func registerNewUser(){
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
