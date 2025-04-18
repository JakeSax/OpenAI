//
//  URLBuilder.swift
//  OpenAI
//
//  Created by Oleksii Nezhyborets on 22.01.2025.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

protocol URLBuilder {
    func buildURL() -> URL
}

struct DefaultURLBuilder: URLBuilder {
    private let configuration: OpenAI.Configuration
    private let path: String
    private let after: String?
    
    init(configuration: OpenAI.Configuration, path: String, after: String? = nil) {
        self.configuration = configuration
        self.path = path
        self.after = after
    }
    
    func buildURL() -> URL {
        var components = URLComponents.components(perConfiguration: configuration, path: path)
        
        if let after {
            components.queryItems = [URLQueryItem(name: "after", value: after)]
        }
        
        return components.urlSafe
    }
}

struct AssistantsURLBuilder: URLBuilder {
    let configuration: OpenAI.Configuration
    let path: APIPath.Assistants
    let assistantID: String
    
    func buildURL() -> URL {
        var components = URLComponents.components(perConfiguration: configuration, path: path.stringValue)
        components.path = components.path.replacingOccurrences(of: "ASST_ID", with: assistantID)
        return components.urlSafe
    }
}

struct RunsURLBuilder: URLBuilder {
    private let configuration: OpenAI.Configuration
    private let path: APIPath.Assistants
    private let threadID: String
    private let before: String?
    
    init(
        configuration: OpenAI.Configuration,
        path: APIPath.Assistants,
        threadID: String,
        before: String? = nil
    ) {
        self.configuration = configuration
        self.path = path
        self.threadID = threadID
        self.before = before
    }
    
    func buildURL() -> URL {
        var components = URLComponents.components(perConfiguration: configuration, path: path.stringValue)
        components.path = components.path.replacingOccurrences(of: "THREAD_ID", with: threadID)
        if let before {
            components.queryItems = [URLQueryItem(name: "before", value: before)]
        }
        return components.urlSafe
    }
}

struct RunRetrieveURLBuilder: URLBuilder {
    private let configuration: OpenAI.Configuration
    private let path: APIPath.Assistants
    private let threadID: String
    private let runID: String
    private let before: String?
    
    init(
        configuration: OpenAI.Configuration,
        path: APIPath.Assistants,
        threadID: String,
        runID: String,
        before: String? = nil
    ) {
        self.configuration = configuration
        self.path = path
        self.threadID = threadID
        self.runID = runID
        self.before = before
    }
    
    func buildURL() -> URL {
        var components = URLComponents.components(perConfiguration: configuration, path: path.stringValue)
        components.path = components.path
            .replacingOccurrences(of: "THREAD_ID", with: threadID)
            .replacingOccurrences(of: "RUN_ID", with: runID)
        
        if let before {
            components.queryItems = [URLQueryItem(name: "before", value: before)]
        }
        return components.urlSafe
    }
}


