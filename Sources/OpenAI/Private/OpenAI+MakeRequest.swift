//
//  OpenAI+MakeRequest.swift
//  OpenAI
//
//  Created by Oleksii Nezhyborets on 31.01.2025.
//

import Foundation

// OpenAI + MakeRequest
extension OpenAI {
    func makeImagesRequest(query: ImagesQuery) -> JSONRequest<ImagesResult> {
        .init(body: query, url: buildURL(path: .images))
    }
    
    func makeImageEditsRequest(query: ImageEditsQuery) -> MultipartFormDataRequest<ImagesResult> {
        .init(body: query, url: buildURL(path: .imageEdits))
    }
    
    func makeImageVariationsRequest(query: ImageVariationsQuery) -> MultipartFormDataRequest<ImagesResult> {
        .init(body: query, url: buildURL(path: .imageVariations))
    }
    
    func makeEmbeddingsRequest(query: EmbeddingsQuery) -> JSONRequest<EmbeddingsResult> {
        .init(body: query, url: buildURL(path: .embeddings))
    }
    
    func makeChatsRequest(query: ChatQuery) -> JSONRequest<ChatResult> {
        .init(body: query, url: buildURL(path: .chats))
    }
    
    func makeModelRequest(query: ModelQuery) -> JSONRequest<ModelResult> {
        .init(url: buildURL(path: .models.withPath(query.model)), method: "GET")
    }
    
    func makeModelsRequest() -> JSONRequest<ModelsResult> {
        .init(url: buildURL(path: .models), method: "GET")
    }
    
    func makeModerationsRequest(query: ModerationsQuery) -> JSONRequest<ModerationsResult> {
        .init(body: query, url: buildURL(path: .moderations))
    }
    
    func makeAudioTranscriptionsRequest(
        query: AudioTranscriptionQuery
    ) -> MultipartFormDataRequest<AudioTranscriptionResult> {
        .init(body: query, url: buildURL(path: .audioTranscriptions))
    }
    
    func makeAudioTranslationsRequest(
        query: AudioTranslationQuery
    ) -> MultipartFormDataRequest<AudioTranslationResult> {
        .init(body: query, url: buildURL(path: .audioTranslations))
    }
    
    func makeAudioCreateSpeechRequest(query: AudioSpeechQuery) -> JSONRequest<AudioSpeechResult> {
        .init(body: query, url: buildURL(path: .audioSpeech))
    }
    
    func makeThreadsAddMessageRequest(
        _ threadID: String,
        _ query: MessageQuery
    ) -> AssistantsRequest<ThreadsMessagesResult> {
        .jsonRequest(
            urlBuilder: RunsURLBuilder(
                configuration: configuration,
                path: .threadsMessages,
                threadID: threadID
            ),
            body: query
        )
    }
    
    func makeThreadsMessagesRequest(
        _ threadID: String,
        before: String?
    ) -> AssistantsRequest<ThreadsMessagesResult> {
        .jsonRequest(
            urlBuilder: RunsURLBuilder(
                configuration: configuration,
                path: .threadsMessages,
                threadID: threadID,
                before: before
            ),
            body: nil,
            method: "GET"
        )
    }
    
    func makeRunRetrieveRequest(
        _ threadID: String,
        _ runID: String
    ) -> AssistantsRequest<RunResult> {
        .jsonRequest(
            urlBuilder: RunRetrieveURLBuilder(
                configuration: configuration,
                path: .runRetrieve,
                threadID: threadID,
                runID: runID
            ),
            body: nil,
            method: "GET"
        )
    }
    
    func makeRunRetrieveStepsRequest(
        _ threadID: String,
        _ runID: String,
        _ before: String?
    ) -> AssistantsRequest<RunRetrieveStepsResult> {
        .jsonRequest(
            urlBuilder: RunRetrieveURLBuilder(
                configuration: configuration,
                path: .runRetrieveSteps,
                threadID: threadID,
                runID: runID,
                before: before
            ),
            body: nil,
            method: "GET"
        )
    }
    
    func makeRunSubmitToolOutputsRequest(
        _ threadID: String,
        _ runID: String,
        _ query: RunToolOutputsQuery
    ) -> AssistantsRequest<RunResult> {
        .jsonRequest(
            urlBuilder: DefaultURLBuilder(
                configuration: configuration,
                path: .Assistants.runSubmitToolOutputs(threadID: threadID, runID: runID).stringValue
            ),
            body: query
        )
    }
    
    func makeRunsRequest(_ threadID: String, _ query: RunsQuery) -> AssistantsRequest<RunResult> {
        .jsonRequest(
            urlBuilder: RunsURLBuilder(
                configuration: configuration,
                path: .runs,
                threadID: threadID
            ),
            body: query
        )
    }
    
    func makeThreadsRequest(_ query: ThreadsQuery) -> AssistantsRequest<ThreadsResult> {
        .jsonRequest(
            urlBuilder: DefaultURLBuilder(
                configuration: configuration,
                path: .Assistants.threads.stringValue
            ),
            body: query
        )
    }
    
    func makeThreadRunRequest(_ query: ThreadRunQuery) -> AssistantsRequest<RunResult> {
        .jsonRequest(
            urlBuilder: DefaultURLBuilder(
                configuration: configuration,
                path: .Assistants.threadRun.stringValue
            ),
            body: query
        )
    }
    
    func makeAssistantsRequest(_ after: String?) -> AssistantsRequest<AssistantsResult> {
        .jsonRequest(
            urlBuilder: DefaultURLBuilder(
                configuration: configuration,
                path: .Assistants.assistants.stringValue,
                after: after
            ),
            body: nil,
            method: "GET"
        )
    }
    
    func makeAssistantCreateRequest(_ query: AssistantsQuery) -> AssistantsRequest<AssistantResult> {
        .jsonRequest(
            urlBuilder: DefaultURLBuilder(
                configuration: configuration,
                path: .Assistants.assistants.stringValue
            ),
            body: query
        )
    }
    
    func makeAssistantModifyRequest(_ assistantID: String, _ query: AssistantsQuery) -> AssistantsRequest<AssistantsResult> {
        .jsonRequest(
            urlBuilder: AssistantsURLBuilder(
                configuration: configuration,
                path: .assistantsModify,
                assistantID: assistantID
            ),
            body: query
        )
    }
    
    func makeFilesRequest(query: FilesQuery) -> AssistantsRequest<FilesResult> {
        .multipartFormDataRequest(
            urlBuilder: DefaultURLBuilder(
                configuration: configuration,
                path: .Assistants.files.stringValue
            ),
            body: query
        )
    }
}
