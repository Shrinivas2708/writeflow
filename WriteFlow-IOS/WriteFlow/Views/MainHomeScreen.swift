import SwiftUI
struct MainHomeScreen: View {
    @State private var blogs: [Blog] = []
    @State private var isLoading = true
    @State private var errorMessage: String? = nil
    @State private var searchText: String = ""
    @State private var navigateToUpdateView = false
    @State private var shouldRefresh = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("WriteFlow")
                                .font(.custom("Times New Roman", size: 30))
                                .bold()
                                .padding(.leading, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Image(uiImage: UIImage(named: "avatar") ?? UIImage())
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .padding(.trailing, 20)
                        }
                        .padding(.top, 20)
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                                .padding(.leading, 16)
                            
                            TextField("Search blogs...", text: $searchText)
                                .padding(10)
                                .foregroundColor(.black)
                        }
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color(UIColor.white)))
                        .padding([.horizontal, .bottom])
                    }
                    .background(Color.F7F4ED)
                    
                    ZStack {
                        if isLoading {
                            ProgressView("Loading Blogs...")
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        } else if let errorMessage = errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        } else if blogs.isEmpty {
                            Text("No blogs available.")
                                .foregroundColor(.gray)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        } else {
                            blogListView
                        }
                    }
                    .background(Color.F7F4ED)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            navigateToUpdateView = true
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .frame(width: 50, height: 50)
                                .background(Color.black)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                        }
                        .padding()
                    }
                }
                
                NavigationLink(
                    destination: CreateBlogView(shouldRefreshParent: $shouldRefresh),
                    isActive: $navigateToUpdateView,
                    label: { EmptyView() }
                )
            }
            .navigationTitle("Blogs")
            .onChange(of: shouldRefresh) { oldValue, newValue in
                if newValue {
                    fetchBlogs()
                    shouldRefresh = false
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear(perform: fetchBlogs)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
    
    var blogListView: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(blogs.reversed(), id: \.id) { blog in
                    blogCardView(for: blog)
                }
            }
            .padding()
        }
    }
    
    private func blogCardView(for blog: Blog) -> some View {
        NavigationLink(destination: BlogDetailView(blog: blog)) {
            HStack(alignment: .top, spacing: 16) {
                Image(uiImage: UIImage(named: "static_image_placeholder") ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(blog.title)
                        .font(.headline)
                        .lineLimit(2)
                        .foregroundColor(.black)
                    
                    Text(blog.content)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(3)
                    
                    HStack {
                        Text(blog.estimdatedReadingTime)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("• \(blog.publishedDate.split(separator: "T").first!)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                Spacer()
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    func fetchBlogs() {
        NetworkManager.shared.sendRequest(
            endpoint: "/bulks",
            method: "GET",
            responseType: BlogsResponse.self
        ) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let response):
                    if response.blogs.isEmpty {
                        self.errorMessage = "No blogs available."
                    } else {
                        self.blogs = response.blogs
                        self.errorMessage = nil
                    }
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    struct BlogsResponse: Decodable {
        let blogs: [Blog]
    }
    struct MainHomeScreen_Preview: PreviewProvider {
        static var previews: some View {
            MainHomeScreen()
        }
    }
}
