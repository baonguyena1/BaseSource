//
//  Company.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/21/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import Foundation

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try (values.decodeIfPresent(String.self, forKey: .name) ?? "")
        catchPhrase = try (values.decodeIfPresent(String.self, forKey: .catchPhrase) ?? "")
        bs = try (values.decodeIfPresent(String.self, forKey: .bs) ?? "")
    }
    
}
