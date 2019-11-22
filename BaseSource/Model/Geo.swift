//
//  Geo.swift
//  BaseSource
//
//  Created by Bao Nguyen on 11/21/19.
//  Copyright © 2019 Bao Nguyen. All rights reserved.
//

import Foundation

struct GeoCation: Codable {
    let lat: String
    let lng: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try (values.decodeIfPresent(String.self, forKey: .lat) ?? "")
        lng = try (values.decodeIfPresent(String.self, forKey: .lng) ?? "")
    }
    
}
