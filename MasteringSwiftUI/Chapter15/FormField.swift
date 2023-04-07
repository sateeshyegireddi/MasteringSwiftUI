//
//  FormField.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 07/04/23.
//

import SwiftUI

struct FormField: View {
    var fieldName = ""
    @Binding var fieldValue: String
    var isSecure = false
    var body: some View {
        VStack {
            if isSecure {
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, design: .rounded))
                    .bold()
                    .padding(.horizontal)
            } else {
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, design: .rounded))
                    .bold()
                    .padding(.horizontal)
            }
            Divider()
                .frame(height: 1)
                .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                .padding(.horizontal)
        }
    }
}

struct FormField_Previews: PreviewProvider {
    static var previews: some View {
        FormField(fieldValue: .constant("Text"))
    }
}
