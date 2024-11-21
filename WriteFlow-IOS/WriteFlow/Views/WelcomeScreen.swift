import SwiftUI
extension Color {
    static let F7F4ED = Color(red: 247/255, green: 244/255, blue: 237/255)
}
struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.F7F4ED
                    .ignoresSafeArea()

                VStack {
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Unfold")
                                .font(.custom("Times New Roman", size: 70))
                                .fontWeight(.bold)
                            Text("Your")
                                .font(.custom("Times New Roman", size: 70))
                                .fontWeight(.bold)
                            Text("Thoughts")
                                .font(.custom("Times New Roman", size: 70))
                                .fontWeight(.bold)
                            Text("Write, Share, Inspire")
                                .font(.custom("Times New Roman", size: 25))
                                .padding(.top, 8)
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.top, 120)

                        Spacer()
                    }

                    Spacer()

                    VStack(spacing: 20) {
                        NavigationLink(destination: SignupView()) {
                            Text("Get Started")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)

                        HStack {
                            Text("Already have an account?")
                                .font(.subheadline)
                                .foregroundColor(.gray)

                            NavigationLink(destination: LoginView()) {
                                Text("Login")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .padding(.bottom, 40)
                }
                .padding()
            }
            .background(Color.F7F4ED) // Consistent background color
            .ignoresSafeArea()
            .navigationBarHidden(true) // Hide the nav bar on WelcomeView
        }
    }
}

// Preview
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
