//
//  OpenAICombine.swift
//  OpenAI
//
//  Created by Oleksii Nezhyborets on 31.01.2025.
//

#if canImport(Combine)
import Foundation
import Combine

@available(iOS 13.0, tvOS 13.0, macOS 10.15, watchOS 6.0, *)
public protocol OpenAICombine {
    func images(query: ImagesQuery) -> AnyPublisher<ImagesResult, Error>
    func imageEdits(query: ImageEditsQuery) -> AnyPublisher<ImagesResult, Error>
    func imageVariations(query: ImageVariationsQuery) -> AnyPublisher<ImagesResult, Error>
    func embeddings(query: EmbeddingsQuery) -> AnyPublisher<EmbeddingsResult, Error>
    func chats(query: ChatQuery) -> AnyPublisher<ChatResult, Error>
    func chatsStream(query: ChatQuery) -> AnyPublisher<Result<ChatStreamResult, Error>, Error>
    func model(query: ModelQuery) -> AnyPublisher<ModelResult, Error>
    func models() -> AnyPublisher<ModelsResult, Error>
    func moderations(query: ModerationsQuery) -> AnyPublisher<ModerationsResult, Error>
    func audioCreateSpeech(query: AudioSpeechQuery) -> AnyPublisher<AudioSpeechResult, Error>
    func audioTranscriptions(query: AudioTranscriptionQuery) -> AnyPublisher<AudioTranscriptionResult, Error>
    func audioTranslations(query: AudioTranslationQuery) -> AnyPublisher<AudioTranslationResult, Error>
    func assistants() -> AnyPublisher<AssistantsResult, Error>
    func assistants(after: String?) -> AnyPublisher<AssistantsResult, Error>
    func assistantCreate(query: AssistantsQuery) -> AnyPublisher<AssistantResult, Error>
    func assistantModify(query: AssistantsQuery, assistantID: String) -> AnyPublisher<AssistantResult, Error>
    func threads(query: ThreadsQuery) -> AnyPublisher<ThreadsResult, Error>
    func threadRun(query: ThreadRunQuery) -> AnyPublisher<RunResult, Error>
    func runs(threadID: String, query: RunsQuery) -> AnyPublisher<RunResult, Error>
    func runRetrieve(threadID: String, runID: String) -> AnyPublisher<RunResult, Error>
    func runRetrieveSteps(threadID: String, runID: String) -> AnyPublisher<RunRetrieveStepsResult, Error>
    func runRetrieveSteps(threadID: String, runID: String, before: String?) -> AnyPublisher<RunRetrieveStepsResult, Error>
    func runSubmitToolOutputs(threadID: String, runID: String, query: RunToolOutputsQuery) -> AnyPublisher<RunResult, Error>
    func threadsMessages(threadID: String) -> AnyPublisher<ThreadsMessagesResult, Error>
    func threadsMessages(threadID: String, before: String?) -> AnyPublisher<ThreadsMessagesResult, Error>
    func threadsAddMessage(threadID: String, query: MessageQuery) -> AnyPublisher<ThreadAddMessageResult, Error>
    func files(query: FilesQuery) -> AnyPublisher<FilesResult, Error>
}
#endif
