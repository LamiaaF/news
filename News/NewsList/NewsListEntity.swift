import Foundation

// MARK: - SourceEntity

struct SourceEntity: Codable {
    var id: String?
    var name: String?
}

// MARK: - ArticleEntity

struct ArticleEntity: Codable {
    var source: SourceEntity?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

// MARK: - NewsEntity

struct NewsEntity: Codable {
    var articles: [ArticleEntity]
}

