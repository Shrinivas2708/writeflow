
import SwiftUI

struct SignupView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var isSignedUp = false

    var body: some View {
        VStack {
            Spacer()

            Text("WriteFlow")
                .font(.custom("Times New Roman", size: 50))
                .fontWeight(.bold)
                .padding(.bottom, 20)

            VStack(spacing: 20) {
                Text("Sign Up")
                    .font(.system(size: 30))
                    .fontWeight(.medium)
                    .padding(.bottom, 10)

                // Username Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("Username")
                        .font(.system(size: 20))
                    TextField("Enter your username", text: $username)
                        .padding(.all, 10)
                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.black))
                        .autocapitalization(.none)
                }

                // Email Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("Email")
                        .font(.system(size: 20))
                    TextField("Enter your email", text: $email)
                        .padding(.all, 10)
                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.black))
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                }

                // Password Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .font(.system(size: 20))
                    SecureField("Enter your password", text: $password)
                        .padding(.all, 10)
                        .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.black))
                        .autocapitalization(.none)
                }

                Button(action: {
                    isSignedUp = true
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(8)
                }
                .disabled(username.isEmpty || email.isEmpty || password.isEmpty)
                .opacity((username.isEmpty || email.isEmpty || password.isEmpty) ? 0.8 : 1.0)

                NavigationLink(destination: MainHomeScreen(), isActive: $isSignedUp) {
                    EmptyView()
                }
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
            .padding(.horizontal, 30)

            Spacer()
        }
        .background(Color.F7F4ED)
        .ignoresSafeArea()
//        .navigationBarBackButtonHidden(true)
    }
}
