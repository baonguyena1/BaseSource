//
//  User.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/21/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address?
    let phone: String
    let website: String
    let company: Company?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try (values.decodeIfPresent(Int.self, forKey: .id) ?? -1)
        name = try (values.decodeIfPresent(String.self, forKey: .name) ?? "")
        username = try (values.decodeIfPresent(String.self, forKey: .username) ?? "")
        email = try (values.decodeIfPresent(String.self, forKey: .email) ?? "")
        address = try values.decodeIfPresent(Address.self, forKey: .address)
        phone = try (values.decodeIfPresent(String.self, forKey: .phone) ?? "")
        website = try (values.decodeIfPresent(String.self, forKey: .website) ?? "")
        company = try values.decodeIfPresent(Company.self, forKey: .company)
    }
    
    var displayName: String {
        if !name.isEmpty {
            return name
        }
        return username
    }
}
