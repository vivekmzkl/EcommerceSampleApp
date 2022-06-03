//
//  HomeViewModel.swift
//  EcommerceApp
//
//  Created by Vivek M on 03/06/22.
//

import Foundation

class HomeViewModel: ViewModel {
    
    var itemsDidChange: ((Any?) -> Void)?
    var errorOccured: ((String) -> Void)?
    var presentAlert: ((String) -> Void)?
    
    var homeData: [HomeData]? {
        didSet {
            itemsDidChange?(homeData)
        }
    }
    
    func fetchList(completion: @escaping (() -> Void)) {
        func processHomeListResponseData(_ data: Data) {
            let decoder = JSONDecoder()
            do {
                let home = try decoder.decode(HomeResponse.self, from: data)
                DispatchQueue.main.async {
                    self.homeData = home.homeData
                }
            } catch {
                self.presentAlert?(error.localizedDescription)
            }
        }
        
        let endpoint = "69ad3ec2-f663-453c-868b-513402e515f0"
        WebServiceHandler.makeCall(endpoint: endpoint) { data in
            processHomeListResponseData(data)
            completion()
        } errorHandler: { errorMessage in
            self.presentAlert?(errorMessage)
            completion()
        }

    }
    
    
}
