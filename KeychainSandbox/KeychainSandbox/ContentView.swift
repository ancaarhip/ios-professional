//
//  ContentView.swift
//  KeychainSandbox
//
//  Created by Anca Arhip on 21.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State var secret: String = ""
    @State var updatedSecret: String = ""
    @State var retreivedSecret: String = ""
    
    var body: some View {
        VStack( spacing: 30 ) {
            HStack {
                TextField("Secret", text: $secret)
                Button("Save") {
                    save()
                }
            }
            .padding()
            
            HStack {
                TextField("Update secret", text: $updatedSecret)
                Button("Update") {
                    update()
                }
            }
            .padding()
            
            Button("Retreive") {
                retreive()
            }
            
            Button("Remove") {
                remove()
            }
            
            Text(retreivedSecret)
        }
    }
    
    func save() {
        do {
            try KeychainInterface.save(password: Data(secret.utf8))
        } catch {
            print(error)
            return
        }
        secret = ""
    }
    
    func update() {
        do {
            try KeychainInterface.update(password: Data(updatedSecret.utf8))
        } catch {
            print(error)
            return
        }
        updatedSecret = ""
    }
    
    func retreive() {

        do {
            let secretData = try KeychainInterface.retrive()
            retreivedSecret = String(data: secretData, encoding: String.Encoding.utf8)!
        } catch {
            print(error)
            return
        }
    }
    
    func remove() {
        do {
            try KeychainInterface.delete()
        } catch {
            print(error)
            return
        }
        retreivedSecret = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(secret: "")
    }
}
