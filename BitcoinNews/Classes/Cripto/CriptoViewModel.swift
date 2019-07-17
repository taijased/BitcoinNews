//
//  CriptoViewModel.swift
//  BitcoinNews
//
//  Created by Maxim Spiridonov on 16/07/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

class CriptoViewModel {
    
    var data: ReadySolutionViewModel

    init() {
        data = ReadySolutionViewModel(iconUrlString: "", name: "", desc: "")
    }
}
