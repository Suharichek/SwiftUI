//
//  ContentView.swift
//  Netologia SwiftUI
//
//  Created by Suharik on 07.10.2022.
//

import SwiftUI


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //ContentView(viewModel: ViewModel(userData: ""))
            TabBarView()
            
        }
    }
}

//MARK: 1 задание

class ViewModel: ObservableObject {
    @Published var userData: String
    init(userData: String) {
        self.userData = userData
    }
}

struct ContentView: View {
    @State private var text: String = ""
    @State private var score: Float = 0.0
    @State private var isAlertPresented: Bool = false
    @ObservedObject var viewModel: ViewModel
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                Image(systemName: "globe")
                    .padding(.all, 20)
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Second text")
                    .font(.headline)
                Spacer()
                Text("\($score.wrappedValue)")
                Slider(value: $score) { _ in
                    ()
                }
                Button("Tap") {
                    if colorScheme != .dark {}
                    isAlertPresented.toggle()
                }
            }
            .background(Color.orange)
            .padding(50)
        }
        // .searchable(text: $text) выдает ошибку
        //        .alert("Title", isPresented: $isAlertPresented, actions: {})
    }
}

//MARK: 2 задание

struct BoldTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.title)
            .font(Font.body.bold())
            .background(Color.orange)
    }
}

struct RegularTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.body)
        
    }
}

//MARK: 3 задание

struct ProfileView: View {
    @State private var email = ""
    @State private var pass = ""
    var body: some View {
        VStack(alignment: .center) {
            Image("logo")
            HStack {
                Image(systemName: "person.fill").foregroundColor(.gray)
                TextField("Email or phone", text: $email)
            }
            .modifier(TextFieldModifier())
            .padding((EdgeInsets(top: 60, leading: 16, bottom: 0, trailing: 16)))
            HStack {
                Image(systemName: "lock.fill").foregroundColor(.gray)
                SecureField("Password", text: $pass)
            }
            .modifier(TextFieldModifier())
            .padding((EdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 16)))
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Log in")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 343, height: 53)
                    .background(Image("pixel")
                                    .resizable())
                    .cornerRadius(10)
            }
        }
    }
}

struct TabBarView: View {
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Feed")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "music.note")
                    Text("Player")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "play.rectangle.fill")
                    Text("Video")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "mic.fill")
                    Text("Recoder")
                }
        }
    }
}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(UIColor.systemGray5))
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(UIColor.systemGray2), lineWidth: 2))
    }
}

