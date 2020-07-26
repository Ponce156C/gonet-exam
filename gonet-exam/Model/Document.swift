//
//  Document.swift
//  gonet-exam
//
//  Created by Carlos Ponce on 26/07/20.
//  Copyright © 2020 Carlos Ponce. All rights reserved.
//

import Foundation

struct Document: Codable {
    var name: String
    var description: String
    var image: String
    var short_description: String
    
    init(dictionary: [String: Any]) throws {
        self = try JSONDecoder().decode(Document.self, from: JSONSerialization.data(withJSONObject: dictionary))
    }
}
