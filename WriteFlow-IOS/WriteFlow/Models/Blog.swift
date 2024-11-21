//struct Author:  Decodable {
//    
//    let name : String
//}
//struct Blog: Identifiable, Decodable{
//    var id : String
//    let title: String
//    let content: String
//    let publishedDate : String
//    let author: Author
//    var estimdatedReadingTime: String{
//        let wordCount = content.split { $0 == " " || $0.isNewline }.count
//        let wordsPerMinute = 200  
//        let minutes = wordCount / wordsPerMinute
//        if minutes == 0{
//            return "Less than 1 min read"
//        }else{
//            return "\(minutes) min read"
//        }
//    }
//}
//struct Author:Decodable{
//    let name: String
//}
//struct Blog: Decodable,Identifiable {
//    let id: String
//    let authorName: Author
//    let title: String
//    let content: String
//    let published: Bool
//    let publishedDate: String
//    var estimdatedReadingTime: String{
//        let wordCount = content.split { $0 == " " || $0.isNewline }.count
//        let wordsPerMinute = 200
//        let minutes = wordCount / wordsPerMinute
//        if minutes == 0{
//            return "Less than 1 min read"
//        }else{
//            return "\(minutes) min read"
//        }
//    }
//}

//struct Blog: Codable {
//    let id: String
//    let authorName: String
//    let title: String
//    let content: String
//    let published: Bool
//    let publishedDate: String
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case authorName
//        case title
//        case content
//        case published
//        case publishedDate
//    }
//    var estimdatedReadingTime: String{
//        let wordCount = content.split { $0 == " " || $0.isNewline }.count
//        let wordsPerMinute = 200
//        let minutes = wordCount / wordsPerMinute
//        if minutes == 0{
//            return "Less than 1 min read"
//        }else{
//            return "\(minutes) min read"
//        }
//    }
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(String.self, forKey: .id)
//        
//        // Decode authorName as a string from array
//        let authorArray = try container.decodeIfPresent([String].self, forKey: .authorName) ?? []
//        authorName = authorArray.joined(separator: ", ")
//        
//        title = try container.decode(String.self, forKey: .title)
//        content = try container.decode(String.self, forKey: .content)
//        published = try container.decode(Bool.self, forKey: .published)
//        publishedDate = try container.decode(String.self, forKey: .publishedDate)
//    }
//}


struct Blog: Decodable {
    let authorName: [String]
    let title: String
    let content: String
    let published: Bool
    let publishedDate: String
    let id: String
    let version: Int

    enum CodingKeys: String, CodingKey {
        case authorName
        case title
        case content
        case published
        case publishedDate
        case id = "_id"
        case version = "__v"
    }
    var estimdatedReadingTime: String{
        let wordCount = content.split { $0 == " " || $0.isNewline }.count
        let wordsPerMinute = 200
        let minutes = wordCount / wordsPerMinute
        if minutes == 0{
            return "Less than 1 min read"
        }else{
            return "\(minutes) min read"
        }
    }
}
