//
//  ContentView.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 29/03/23.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    var model: Model
    var bag = Set<AnyCancellable>()

    init(model: Model = Model()) {
        self.model = model

        model.$foo.sink { newValue in
            self.objectWillChange.send()
        }
        .store(in: &bag)
    }

    func toggleFoo() {
        model.foo.toggle()
        objectWillChange.send()
    }
}

class Model: ObservableObject {
    @Published var foo = false

    init(foo: Bool = false) {
        self.foo = foo

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.foo.toggle()
        }
    }
}

//struct Model {
//    var foo = false
//}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State var isLoading = false

    var body: some View {
        NavigationStack {
            Button {
                viewModel.toggleFoo()
            } label: {
                Text(viewModel.model.foo ? "ON" : "OFF")
            }
            Text("\(Int.random(in: 1..<10))")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
