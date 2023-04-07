//
//  UserRegistrationViewModel.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 07/04/23.
//

import Foundation
import Combine

class UserRegistrationViewModel: ObservableObject {

    // Input
    @Published var username = ""
    @Published var password = ""
    @Published var passwordConfirm = ""
    
    // Output
    @Published var isUsernameLengthValid = false
    @Published var isPasswordLengthValid = false
    @Published var isPasswordCapitalLetter = false
    @Published var isPasswordConfirmValid = false
    
    private var cancellableSet = Set<AnyCancellable>()

    init() {
        $username
            .receive(on: RunLoop.main)
            .map { name in name.count >= 4 }
            .assign(to: \.isUsernameLengthValid, on: self)
            .store(in: &cancellableSet)

        $password
            .receive(on: RunLoop.main)
            .map { password in password.count >= 8 }
            .assign(to: \.isPasswordLengthValid, on: self)
            .store(in: &cancellableSet)

        $password
            .receive(on: RunLoop.main)
            .map { password in
                let pattern = "[A-Z]"
                if let _ = password.range(of: pattern, options: .regularExpression) {
                    return true
                }
                return false
            }
            .assign(to: \.isPasswordCapitalLetter, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest($password, $passwordConfirm)
            .receive(on: RunLoop.main)
            .map { password, passwordConfirm in
                return !passwordConfirm.isEmpty && password == passwordConfirm
            }
            .assign(to: \.isPasswordConfirmValid, on: self)
            .store(in: &cancellableSet)
    }
}
