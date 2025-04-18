//
//  OpenAI+OpenAICombine.swift
//  OpenAI
//
//  Created by Oleksii Nezhyborets on 31.01.2025.
//

#if canImport(Combine)
import Combine
import Foundation

@available(iOS 13.0, tvOS 13.0, macOS 10.15, watchOS 6.0, *)
extension OpenAI: OpenAICombine {
    public func images(query: ImagesQuery) -> AnyPublisher<ImagesResult, any Error> {
        performRequestCombine(request: makeImagesRequest(query: query))
    }
    
    public func imageEdits(query: ImageEditsQuery) -> AnyPublisher<ImagesResult, Error> {
        performRequestCombine(
            request: makeImageEditsRequest(query: query)
        )
    }
    
    public func imageVariations(query: ImageVariationsQuery) -> AnyPublisher<ImagesResult, Error> {
        performRequestCombine(
            request: makeImageVariationsRequest(query: query)
        )
    }
    
    public func embeddings(query: EmbeddingsQuery) -> AnyPublisher<EmbeddingsResult, Error> {
        performRequestCombine(
            request: makeEmbeddingsRequest(query: query)
        )
    }
    
    public func chats(query: ChatQuery) -> AnyPublisher<ChatResult, Error> {
        performRequestCombine(
            request: makeChatsRequest(query: query)
        )
    }
    
    public func chatsStream(query: ChatQuery) -> AnyPublisher<Result<ChatStreamResult, Error>, Error> {
        let progress = SendablePassthroughSubject(
            passthroughSubject: PassthroughSubject<Result<ChatStreamResult, Error>, Error>()
        )
        
        let cancellable = chatsStream(query: query) { result in
            progress.send(result)
        } completion: { error in
            if let error {
                progress.send(completion: .failure(error))
            } else {
                progress.send(completion: .finished)
            }
        }
        return progress
            .publisher()
            .handleEvents(receiveCancel: {
                cancellable.cancelRequest()
            })
            .eraseToAnyPublisher()
    }
    
    public func model(query: ModelQuery) -> AnyPublisher<ModelResult, Error> {
        performRequestCombine(
            request: makeModelRequest(query: query)
        )
    }
    
    public func models() -> AnyPublisher<ModelsResult, Error> {
        performRequestCombine(
            request: makeModelsRequest()
        )
    }
    
    public func moderations(query: ModerationsQuery) -> AnyPublisher<ModerationsResult, Error> {
        performRequestCombine(
            request: makeModerationsRequest(query: query)
        )
    }
    
    public func audioCreateSpeech(query: AudioSpeechQuery) -> AnyPublisher<AudioSpeechResult, Error> {
        performSpeechRequestCombine(
            request: makeAudioCreateSpeechRequest(query: query)
        )
    }
    
    func audioCreateSpeechStream(query: AudioSpeechQuery) -> AnyPublisher<Result<AudioSpeechResult, Error>, Error> {
        let progress = SendablePassthroughSubject(
            passthroughSubject: PassthroughSubject<Result<AudioSpeechResult, Error>, Error>()
        )
        
        let cancellable = audioCreateSpeechStream(query: query) { result in
            progress.send(result)
        } completion: { error in
            if let error {
                progress.send(completion: .failure(error))
            } else {
                progress.send(completion: .finished)
            }
        }
        return progress
            .publisher()
            .handleEvents(receiveCancel: {
                cancellable.cancelRequest()
            })
            .eraseToAnyPublisher()
    }
    
    public func audioTranscriptions(query: AudioTranscriptionQuery) -> AnyPublisher<AudioTranscriptionResult, Error> {
        performRequestCombine(
            request: makeAudioTranscriptionsRequest(query: query)
        )
    }
    
    public func audioTranslations(query: AudioTranslationQuery) -> AnyPublisher<AudioTranslationResult, Error> {
        performRequestCombine(
            request: makeAudioTranslationsRequest(query: query)
        )
    }
    
    public func assistants() -> AnyPublisher<AssistantsResult, Error> {
        assistants(after: nil)
    }
    
    public func assistants(after: String?) -> AnyPublisher<AssistantsResult, Error> {
        performRequestCombine(
            request: makeAssistantsRequest(after)
        )
    }
    
    public func assistantCreate(query: AssistantsQuery) -> AnyPublisher<AssistantResult, Error> {
        performRequestCombine(
            request: makeAssistantCreateRequest(query)
        )
    }
    
    public func assistantModify(query: AssistantsQuery, assistantID: String) -> AnyPublisher<AssistantResult, Error> {
        performRequestCombine(
            request: makeAssistantModifyRequest(assistantID, query)
        )
    }
    
    public func threads(query: ThreadsQuery) -> AnyPublisher<ThreadsResult, Error> {
        performRequestCombine(
            request: makeThreadsRequest(query)
        )
    }
    
    public func threadRun(query: ThreadRunQuery) -> AnyPublisher<RunResult, Error> {
        performRequestCombine(
            request: makeThreadRunRequest(query)
        )
    }
    
    public func runs(threadID: String, query: RunsQuery) -> AnyPublisher<RunResult, Error> {
        performRequestCombine(
            request: makeRunsRequest(threadID, query)
        )
    }
    
    public func runRetrieve(threadID: String, runID: String) -> AnyPublisher<RunResult, Error> {
        performRequestCombine(
            request: makeRunRetrieveRequest(threadID, runID)
        )
    }
    
    public func runRetrieveSteps(threadID: String, runID: String) -> AnyPublisher<RunRetrieveStepsResult, Error> {
        runRetrieveSteps(threadID: threadID, runID: runID, before: nil)
    }
    
    public func runRetrieveSteps(threadID: String, runID: String, before: String?) -> AnyPublisher<RunRetrieveStepsResult, Error> {
        performRequestCombine(
            request: makeRunRetrieveStepsRequest(threadID, runID, before)
        )
    }
    
    public func runSubmitToolOutputs(threadID: String, runID: String, query: RunToolOutputsQuery) -> AnyPublisher<RunResult, Error> {
        performRequestCombine(
            request: makeRunSubmitToolOutputsRequest(threadID, runID, query)
        )
    }
    
    public func threadsMessages(threadID: String) -> AnyPublisher<ThreadsMessagesResult, any Error> {
        threadsMessages(threadID: threadID, before: nil)
    }
    
    public func threadsMessages(threadID: String, before: String?) -> AnyPublisher<ThreadsMessagesResult, Error> {
        performRequestCombine(
            request: makeThreadsMessagesRequest(threadID, before: before)
        )
    }
    
    public func threadsAddMessage(threadID: String, query: MessageQuery) -> AnyPublisher<ThreadAddMessageResult, Error> {
        performRequestCombine(
            request: makeThreadsAddMessageRequest(threadID, query)
        )
    }
    
    public func files(query: FilesQuery) -> AnyPublisher<FilesResult, Error> {
        performRequestCombine(
            request: makeFilesRequest(query: query)
        )
    }
    
    func performRequestCombine<ResultType: Codable>(request: any URLRequestBuildable) -> AnyPublisher<ResultType, Error> {
        do {
            let urlRequest = try request.build(configuration: configuration)
            let interceptedRequest = middlewares.reduce(urlRequest) { current, middleware in
                middleware.intercept(request: current)
            }

            let parsingOptions = configuration.parsingOptions
            return session
                .dataTaskPublisher(for: interceptedRequest)
                .tryMap { (data, response) in
                    let decoder = JSONDecoder()
                    decoder.userInfo[.parsingOptions] = parsingOptions
                    let (_, interceptedData) = self.middlewares.reduce((response, data)) { current, middleware in
                        middleware.intercept(response: current.response, request: urlRequest, data: current.data)
                    }
                    do {
                        return try decoder.decode(ResultType.self, from: interceptedData ?? data)
                    } catch {
                        throw (try? decoder.decode(APIErrorResponse.self, from: interceptedData ?? data)) ?? error
                    }
                }.eraseToAnyPublisher()
        } catch {
            return Fail(outputType: ResultType.self, failure: error)
                .eraseToAnyPublisher()
        }
    }
    
    func performSpeechRequestCombine(request: any URLRequestBuildable) -> AnyPublisher<AudioSpeechResult, Error> {
        do {
            let urlRequest = try request.build(configuration: configuration)
            let interceptedRequest = middlewares.reduce(urlRequest) { current, middleware in
                middleware.intercept(request: current)
            }
            return session
                .dataTaskPublisher(for: interceptedRequest)
                .tryMap { (data, response) in
                    let (_, interceptedData) = self.middlewares.reduce((response, data)) { current, middleware in
                        middleware.intercept(response: current.response, request: urlRequest, data: current.data)
                    }
                    return .init(audio: interceptedData ?? data)
                }.eraseToAnyPublisher()
        } catch {
            return Fail(outputType: AudioSpeechResult.self, failure: error)
                .eraseToAnyPublisher()
        }
    }
}
#endif
