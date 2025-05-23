//
//  AssistantResult.swift
//  
//
//  Created by Brent Whitman on 2024-01-29.
//

import Foundation

public struct AssistantResult: Codable, Equatable, Sendable {
    public let id: String
    public let name: String?
    public let description: String?
    public let instructions: String?
    public let tools: [Tool]?
    public let toolResources: ToolResources?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case instructions
        case tools
        case toolResources = "tool_resources"
    }
}

public struct ToolResources: Codable, Equatable, Sendable {
    public let fileSearch: FileSearchResources?
    public let codeInterpreter: CodeInterpreterResources?
    
    public init(fileSearch: FileSearchResources?, codeInterpreter: CodeInterpreterResources?) {
        self.fileSearch = fileSearch
        self.codeInterpreter = codeInterpreter
    }
    
    enum CodingKeys: String, CodingKey {
        case fileSearch = "file_search"
        case codeInterpreter = "code_interpreter"
    }
}

public struct FileSearchResources: Codable, Equatable, Sendable {
    public let vectorStoreIDs: [String]
    
    enum CodingKeys: String, CodingKey {
        case vectorStoreIDs = "vector_store_ids"
    }
}

public struct CodeInterpreterResources: Codable, Equatable, Sendable {
    public let fileIDs: [String]
    
    public init(fileIDs: [String]) {
        self.fileIDs = fileIDs
    }
    
    enum CodingKeys: String, CodingKey {
        case fileIDs = "file_ids"
    }
}
