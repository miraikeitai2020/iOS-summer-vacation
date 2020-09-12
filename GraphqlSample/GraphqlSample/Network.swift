//
//  Network.swift
//  GraphqlSample
//
//  Created by 工藤海斗 on 2020/09/09.
//  Copyright © 2020 工藤海斗. All rights reserved.
//

import Apollo
import Foundation

class Network {
    static let shared = Network()
   
    private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:9020/query")!)
}
