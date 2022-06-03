//
//  WebServiceHandler.swift
//  EcommerceApp
//
//  Created by Vivek M on 03/06/22.
//

import Foundation

struct WebServiceHandler {
    static func makeCall(endpoint: String,
                         successHandler: @escaping ((_ data: Data) -> ()),
                         errorHandler: @escaping ((_ errorMessage: String) -> ())) {
        let domainUrlString = "https://run.mocky.io/"
        let version = "v3/"
        
        let url = URL(string: domainUrlString + version + endpoint)!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                let message = "Error with fetching films: \(error)"
                print(message)
                errorHandler(message)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      let message = ("Error with the response, unexpected status code: \(String(describing: response))")
                      errorHandler(message)
                      return
                  }
            
            if let data = data {
                successHandler(data)
            }
        })
        
        task.resume()
    }
}
