//
//  Bindable.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 2022-07-30.
//

import Foundation

class Bindable<T> {
    
    // MARK: Properties
    var value: T? {
        didSet { observer?(value) }
    }
    
    
    private var observer: ((T?) -> ())?
}

// MARK: - Methods
extension Bindable {
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
}
