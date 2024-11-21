//import SwiftUI
//
//struct CreateBlogView: View {
//    @State private var title: String = ""
//    @State private var content: String = ""
//    @Environment(\.dismiss) private var dismiss
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            HStack(spacing: 16) {
//                Button(action: {
//                    dismiss()
//                }) {
//                    Image(systemName: "chevron.left")
//                        .font(.system(size: 18, weight: .semibold))
//                        .foregroundColor(.black)
//                }
//                
//                Spacer()
//                
//                Image(uiImage: UIImage(named: "avatar") ?? UIImage())
//                    .resizable()
//                    .clipShape(Circle())
//                    .frame(width: 50, height: 50)
//                    .padding(.trailing, 16)
//            }
//            Text("Create A Blog")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//            
//            TextField("Enter Title", text: $title)
//                .padding()
//                .background(Color.white)
//                .cornerRadius(10)
//                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
//            
//            TextEditor(text: $content)
//                .frame(height: 200)
//                .padding()
//                .background(Color.white)
//                .cornerRadius(10)
//                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
//                .overlay(
//                    Text(content.isEmpty ? "Enter content" : "")
//                        .foregroundColor(.gray)
//                        .padding(8),
//                    alignment: .topLeading
//                )
//            
//            Spacer()
//        }
//        .padding()
//        .background(Color(red: 0.97, green: 0.95, blue: 0.93))
//        .toolbar(.hidden, for: .navigationBar) // Hides the navigation bar
//    }
//}
//
//struct CreateBlogView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateBlogView()
//    }
//}

//import SwiftUI
//
//struct CreateBlogView: View {
//    @State private var title: String = ""
//    @State private var content: String = ""
//    @Environment(\.dismiss) private var dismiss
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            // Header with back button and avatar
//            HStack(spacing: 16) {
//                Button(action: {
//                    dismiss()
//                }) {
//                    Image(systemName: "chevron.left")
//                        .font(.system(size: 18, weight: .semibold))
//                        .foregroundColor(.black)
//                }
//
//                Spacer()
//
//                Image(uiImage: UIImage(named: "avatar") ?? UIImage())
//                    .resizable()
//                    .frame(width: 50, height: 50)
//                    .clipShape(Circle())
//            }
//            .padding(.horizontal)
//
//            // Page Title
//            Text("Create A Blog")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .padding(.horizontal)
//
//            // Title TextField
//            TextField("Enter Title", text: $title)
//                .padding()
//                .background(Color.white)
//                .cornerRadius(10)
//                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
//                .padding(.horizontal)
//
//            // Content TextEditor
//            ZStack(alignment: .topLeading) {
//                TextEditor(text: $content)
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(10)
//                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
//                    .frame(height: 200)
//
//                if content.isEmpty {
//                    Text("Enter content")
//                        .foregroundColor(.gray)
//                        .padding(16)
//                }
//            }
//            .padding(.horizontal)
//
//            Spacer()
//
//            // Create Button
//            Button(action: {
//                // Handle the create action
//            }) {
//                Text("Create")
//                    .font(.headline)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.black)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .padding(.horizontal)
//            .padding()
//        }
//        .padding(.top)
//        .background(Color(red: 0.97, green: 0.95, blue: 0.93))
//        .edgesIgnoringSafeArea(.bottom)
//    }
//}
//
//struct CreateBlogView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateBlogView()
//    }
//}


import SwiftUI

struct CreateBlogView: View {
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var showToast: Bool = false
    @State private var toastMessage: String = ""
    @State private var isError: Bool = false
    @Environment(\.dismiss) private var dismiss
    @Binding var shouldRefreshParent: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header with back button and avatar
            HStack(spacing: 16) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                }

                Spacer()

                Image(uiImage: UIImage(named: "avatar") ?? UIImage())
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            .padding(.horizontal)

            // Page Title
            Text("Create A Blog")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)

            // Title TextField
            TextField("Enter Title", text: $title)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                .padding(.horizontal)

            // Content TextEditor
            ZStack(alignment: .topLeading) {
                TextEditor(text: $content)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                    .frame(height: 200)

                if content.isEmpty {
                    Text("Enter content")
                        .foregroundColor(.gray)
                        .padding(16)
                }
            }
            .padding(.horizontal)

            Spacer()

            // Create Button
            Button(action: {
                createBlog()
            }) {
                Text("Create")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .padding(.top)
        .background(Color(red: 0.97, green: 0.95, blue: 0.93))
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)  // Hide default back button
        .toast(isPresented: $showToast, message: toastMessage, isError: isError)
    }

    // Function to handle blog creation
    private func createBlog() {
            guard !title.isEmpty && !content.isEmpty else {
                showToastWithMessage("Fields cannot be empty", isError: true)
                return
            }

            let blogData = ["title": title, "content": content]
            guard let jsonData = try? JSONSerialization.data(withJSONObject: blogData) else {
                showToastWithMessage("Failed to encode data", isError: true)
                return
            }
        NetworkManager.shared.sendRequest(
            endpoint: "/publish",
            method: "POST",
            body: jsonData,
            responseType: BlogResponse.self
        ) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    showToastWithMessage(response.message, isError: false)
                    title = ""
                    content = ""
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        shouldRefreshParent = true  // Trigger refresh in parent
                        dismiss()
                    }
                case .failure(let error):
                    showToastWithMessage("Failed to create blog: \(error.localizedDescription)", isError: true)
                }
            }
        }
//            NetworkManager.shared.sendRequest(
//                endpoint: "/publish",
//                method: "POST",
//                body: jsonData,
//                responseType: BlogResponse.self
//            ) { result in
//                DispatchQueue.main.async {
//                    switch result {
//                        
//                    case .success(let response):
//                        print(response)
//                        if response.message == "Blog published successfully" {
//                            showToastWithMessage(response.message, isError: false)
//                            title = ""
//                            content = ""
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                                shouldRefreshParent = true
//                                dismiss()
//                            }
//                        } else {
//                            showToastWithMessage("Unexpected response: \(response.message)", isError: true)
//                        }
//                    case .failure(let error):
//                        print(error)
//                        print(result)
//                        showToastWithMessage("Failed to create blog: \(error.localizedDescription)", isError: true)
//                    }
//                }
//            }
        }


    // Helper to show toast
    private func showToastWithMessage(_ message: String, isError: Bool) {
        toastMessage = message
        self.isError = isError
        showToast = true
    }
}

// Dummy BlogResponse model
struct BlogResponse: Decodable {
    let message: String
    let blog: Blog
}


// Toast view modifier
extension View {
    func toast(isPresented: Binding<Bool>, message: String, isError: Bool) -> some View {
        ZStack {
            self
            if isPresented.wrappedValue {
                VStack {
                    Text(message)
                        .font(.body)
                        .padding()
                        .background(isError ? Color.red : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                        .padding(.top, 20)
                    Spacer()
                }
                .transition(.opacity)
                .animation(.easeInOut, value: isPresented.wrappedValue)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isPresented.wrappedValue = false
                    }
                }
                
            }
            
        }
        
    }
    
}

//struct CreateBlogView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateBlogView()
//    }
//}
