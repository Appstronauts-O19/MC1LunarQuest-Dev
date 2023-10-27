import Foundation
import SwiftUI

struct UserModel: Identifiable, Codable {
    let id: UUID
    var username: String
    var role: Role
    var badges: [String]
    var hasCompletedSetup : Bool

    init(id: UUID = UUID(), username: String = "John Doe", role: Role = .explorer, badges: [String] = [], hasCompletedSetup: Bool = false) {
        self.id = id
        self.username = username
        self.role = role
        self.badges = badges
        self.hasCompletedSetup = hasCompletedSetup
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

