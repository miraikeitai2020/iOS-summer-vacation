//
//  ViewPresenter.swift
//  GraphqlSample
//
//  Created by 工藤海斗 on 2020/09/12.
//  Copyright © 2020 工藤海斗. All rights reserved.
//

import Foundation

class ViewPresenter {
    
    private var viewProtocol: ViewProtocol!
    
    init(view: ViewProtocol) {
        self.viewProtocol = view
    }
    
    func loadCities(completion: @escaping ([AllCityQuery.Data.AllCity]) -> Void) {
        
        Network.shared.apollo.fetch(query: AllCityQuery()) { [weak self] result in
            
            guard let self = self else {
              return
            }

            defer {
                self.viewProtocol.reloadData()
            }
            
            switch result {
            case .success(let graphQLResult):
                completion(graphQLResult.data!.allCity)
                
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}
