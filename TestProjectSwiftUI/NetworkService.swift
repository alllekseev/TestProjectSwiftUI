//
//  NetworkService.swift
//  TestProjectSwiftUI
//
//  Created by Олег Алексеев on 20.09.2023.
//

import Foundation

final class NetworkService {
    private let baseUrlString = "https://kudago.com"

    private var urlRequest: URLRequest? {
        let urlComponents = URLComponents(string: "\(baseUrlString)/public-api/v1.4/news/")

        guard var urlComponents else { return nil }

        urlComponents.queryItems = [
            URLQueryItem(name: "fields", value: "id,publication_date,title")
        ]

        guard let url = urlComponents.url else { return nil }

        return URLRequest(url: url)
    }

    func getNews(_ completion: @escaping ([News]) -> ()) {

        guard let urlRequest = urlRequest else { return }

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            do {
                guard let data else { return }
                let fetchedData = try JSONDecoder().decode(NewsModel.self, from: data)
                completion(fetchedData.results)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
