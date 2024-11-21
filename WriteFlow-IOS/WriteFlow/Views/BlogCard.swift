import SwiftUI

struct BlogCard: View {
    let blog: Blog
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "photo") 
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()

            Text(blog.title)
                .font(.headline)
                .padding([.top, .horizontal])
            
            Text(blog.content.prefix(100) + "...")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding([.bottom, .horizontal])
            
            HStack {
                Text("By \(blog.authorName)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
                Text(blog.estimdatedReadingTime)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding([.bottom, .horizontal])
        }
        .background(Color.F7F4ED)
//        .ignoresSafeArea()
        .cornerRadius(8)
        .shadow(radius: 5)
        .padding([.top, .horizontal])
    }
}
