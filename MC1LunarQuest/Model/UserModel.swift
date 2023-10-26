import Foundation
import SwiftUI

struct UserModel: Identifiable, Codable {
    let id: UUID
    var username: String
    var role: Role
    var badges: [Badge]
    var hasCompletedSetup : Bool

    init(id: UUID = UUID(), username: String = "John Doe", role: Role = .explorer, badges: [Badge] = [], hasCompletedSetup: Bool = false) {
        self.id = id
        self.username = username
        self.role = role
        self.badges = badges
        self.hasCompletedSetup = hasCompletedSetup
    }
}

extension UserModel {
    struct Badge: Identifiable, Codable {
        var id: String
        var image: Image

        // Custom CodingKeys to specify how Badge is encoded/decoded
        private enum CodingKeys: String, CodingKey {
            case id
            case imageName
        }

        // Custom initializer to decode a Badge
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            let imageName = try container.decode(String.self, forKey: .imageName)
            image = Image(systemName: imageName)
        }

        // Custom method to encode a Badge
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            // If you need to store the image name for decoding, you can extract it from the Image here.
        }
    }
}

extension UserModel {
    enum Role: String, Codable {
        case scientist
        case explorer

        var stringValue: String {
            switch self {
            case .explorer:
                return "Explorer"
            case .scientist:
                return "Scientist"
            }
        }
    }
}

@MainActor
class UserData: ObservableObject {
    @Published var user : UserModel = UserModel()
    
    private static func fileURL() throws -> URL {
            try FileManager.default.url(for: .documentDirectory,
                                        in: .userDomainMask,
                                        appropriateFor: nil,
                                        create: false)
                .appendingPathComponent("user.data")
        }

    func load() async throws {
        
            let task = Task<UserModel, Error> {
                let fileURL = try Self.fileURL()
                guard let data = try? Data(contentsOf: fileURL) else {
                    return UserModel()
                }
                let userData = try JSONDecoder().decode(UserModel.self, from: data)
                return userData
            }
        
        let user = try await task.value
        self.user = user
        
        }
    
    func save(user: UserModel) async throws {
            let task = Task {
                let data = try JSONEncoder().encode(user)
                let outfile = try Self.fileURL()
                try data.write(to: outfile)
            }
            _ = try await task.value
        }
}
