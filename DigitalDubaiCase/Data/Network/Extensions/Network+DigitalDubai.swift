//
//  Network+DigitalDubai.swift
//  DigitalDubai
//
//  Created by Halil İbrahim YILMAZ on 26.02.2022.
//

import Foundation
import Combine

typealias DataTaskResult = (data: Data, response: URLResponse)

enum ValidationError: Error {
    case genericError(Error)
    case jsonError(Data)
}

extension Publisher where Output == DataTaskResult {
    func validateStatusCode(_ isValid: @escaping (Int) -> Bool) -> AnyPublisher<Output, NetworkError> {
        return validateResponse { (data, response) in
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            return isValid(statusCode)
        }
    }

    func validateResponse(_ isValid: @escaping (DataTaskResult) -> Bool) -> AnyPublisher<Output, NetworkError> {
        return self
            .mapError { .error(model: $0) }
            .flatMap { (result) -> AnyPublisher<DataTaskResult, NetworkError> in
                let (data, _) = result
                if isValid(result) {
                    return Just(result)
                        .setFailureType(to: NetworkError.self)
                        .eraseToAnyPublisher()
                } else {
                    return Fail(outputType: Output.self, failure: .jsonError(data: data))
                        .eraseToAnyPublisher()
                }}
            .eraseToAnyPublisher()
    }
    
    func mapJsonValue<Output: Decodable>(to outputType: Output.Type, decoder: JSONDecoder) -> AnyPublisher<Output?, Error> {
        return self
            .map(\.data)
            .decode(type: BaseModel<Output>.self, decoder: decoder)
            .flatMap { baseModel -> AnyPublisher<Output?, Error> in
                if baseModel.status == Constants.API.statusOK {
                    return Just(baseModel.results)
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                } else {
                    return Fail(outputType: Output?.self, failure: NetworkError.decodingFailed as Error)
                        .eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    func mapJsonValueBaseModel<Output: Decodable>(to outputType: Output.Type, decoder: JSONDecoder) -> AnyPublisher<Output, Error> {
        return self
            .map(\.data)
            .decode(type: outputType, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
