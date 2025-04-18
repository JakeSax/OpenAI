//
//  AssistantsQuery.swift
//  
//
//  Created by Chris Dillard on 11/07/2023.
//

import Foundation

public struct RunsQuery: Codable, Sendable {

    public let assistantID: String

    enum CodingKeys: String, CodingKey {
        case assistantID = "assistant_id"
    }
    
    public init(assistantID: String) {
        self.assistantID = assistantID
    }
}
