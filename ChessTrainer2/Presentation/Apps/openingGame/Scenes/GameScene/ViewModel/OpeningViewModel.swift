//
//  OpeningViewModel.swift
//  ChessTrainer2
//
//  Created by Guest User on 6/11/21.
//

import Foundation
import UIKit

class OpeningViewModel {
    
    var openingFilter: OpeningFilter!
    var openingParser: OpeningParser!
    
    init(with filter: OpeningFilter, with2 parser: OpeningParser) {
        openingFilter = filter
        openingParser = parser
    }
    
    func getData(completion: @escaping ([Opening])  -> Void) {
        openingFilter.fetchData { jsonModels in
            DispatchQueue.main.async {
                completion(jsonModels)
            }
        }
    }
}
