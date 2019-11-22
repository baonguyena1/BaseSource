//
//  Address.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/21/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import Foundation

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: GeoCation?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        street = try (values.decodeIfPresent(String.self, forKey: .street) ?? "")
        suite = try (values.decodeIfPresent(String.self, forKey: .suite) ?? "")
        city = try (values.decodeIfPresent(String.self, forKey: .city) ?? "")
        zipcode = try (values.decodeIfPresent(String.self, forKey: .zipcode) ?? "")
        geo = try values.decodeIfPresent(GeoCation.self, forKey: .geo)
    }
    
}
