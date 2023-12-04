//
//  NetworkClient.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import Foundation

protocol NetworkClient {
    func request<T: Decodable>(endpoint: EndpointProtocol, responseModel: T.Type) async -> Result<T, RequestError>
}

extension NetworkClient {

    func request<T: Decodable>(endpoint: EndpointProtocol, responseModel: T.Type) async -> Result<T, RequestError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path

        guard let url = urlComponents.url else { return .failure(.invalidURL) }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else { return .failure(.noResponse) }

            switch response.statusCode {
            case 200...299:
                guard let decodedData = try? JSONDecoder().decode(responseModel, from: data) else { return .failure(.decode) }
                return .success(decodedData)

            case 401:
                return .failure(.unauthorized)

            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
