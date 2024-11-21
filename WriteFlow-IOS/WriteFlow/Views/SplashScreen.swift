import SwiftUI

struct SplashScreen: View {
    @State private var moveTextUp = false
    @State private var showNextScreen = false

    var body: some View {
        if showNextScreen {
            WelcomeView()
        } else {
            ZStack {
                Color(Color.F7F4ED) 
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    Text("WriteFlow")
                        .font(.custom("Times New Roman", size: 70))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .offset(y: moveTextUp ? -100 : 0) 
                        .animation(.easeOut(duration: 2), value: moveTextUp)
                }
                .padding(.bottom,300)
                .onAppear {
                    withAnimation {
                        moveTextUp = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        showNextScreen = true
                    }
                }
            }
        }
    }
}



