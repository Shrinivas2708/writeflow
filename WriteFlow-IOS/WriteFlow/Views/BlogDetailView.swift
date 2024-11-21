import SwiftUI

struct BlogDetailView: View {
    let blog: Blog
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 16) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: "avatar") ?? UIImage())
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                        .padding(.trailing, 16)
                }
                .padding(.horizontal)
                .padding(.top)
                
                Image(uiImage: UIImage(named: "static_image_placeholder") ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(12)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(blog.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                    
                    Text("Created By: \(blog.authorName)")
                        .font(.system(size: 16, weight: .semibold))
                    
                    Text("\(blog.publishedDate.split(separator: "T").first!) • \(blog.estimdatedReadingTime)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(blog.content)
                        .font(.body)
                        .lineSpacing(5)
                        .padding(.top, 8)
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 20)
        }
        .background(Color.F7F4ED)
        .navigationBarHidden(true)
    }
}
