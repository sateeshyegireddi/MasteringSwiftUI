//
//  Chapter15View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 07/04/23.
//

import SwiftUI

struct Chapter15View: View {
    @ObservedObject var viewModel = UserRegistrationViewModel()
    private let errorColor = Color(red: 251/255, green: 128/255, blue: 128/255)

    var body: some View {
        VStack {
            Text("Create an account")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 30)

            FormField(fieldName: "Username",
                      fieldValue: $viewModel.username)
            RequirementText(
                iconColor: viewModel.isUsernameLengthValid ? .secondary : errorColor,
                text: "A minimum of 4 characters",
                isStrikeThrough: viewModel.isUsernameLengthValid
            )
            .padding()

            FormField(fieldName: "Password",
                      fieldValue: $viewModel.password,
                      isSecure: true)
            VStack {
                RequirementText(
                    iconName: "lock.open",
                    iconColor: viewModel.isPasswordLengthValid ? .secondary : errorColor,
                    text: "A minimum of 8 characters",
                    isStrikeThrough: viewModel.isPasswordLengthValid
                )
                RequirementText(
                    iconName: "lock.open",
                    iconColor: viewModel.isPasswordCapitalLetter ? .secondary : errorColor,
                    text: "One uppercase letter",
                    isStrikeThrough: viewModel.isPasswordCapitalLetter
                )
            }
            .padding()

            FormField(fieldName: "Confirm Password",
                      fieldValue: $viewModel.passwordConfirm,
                      isSecure: true)
            RequirementText(
                iconColor: viewModel.isPasswordConfirmValid ? .secondary : errorColor,
                text: "Your confirm password should be the same as password",
                isStrikeThrough: viewModel.isPasswordConfirmValid
            )
            .padding()

            Button {
                // Handle Sign Up Actions
            } label: {
                Text("Sign Up")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background {
                        LinearGradient(colors: [
                            Color(red: 251/255, green: 128/255, blue: 128/255),
                            Color(red: 253/255, green: 193/255, blue: 104/255)
                        ], startPoint: .leading, endPoint: .trailing)
                    }
                    .cornerRadius(10)
                    .padding()
            }

            HStack {
                Text("Already have an account?")
                    .font(.system(.body, design: .rounded))
                    .bold()
                Button {
                    
                } label: {
                    Text("Sign in")
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
                }
            }
            .padding()

            Spacer()
        }
        .padding()
    }
}

struct Chapter15View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter15View()
    }
}
