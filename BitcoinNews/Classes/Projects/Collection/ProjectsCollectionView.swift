//
//  ProjectsCollectionView.swift
//  ARI
//
//  Created by Maxim Spiridonov on 11/06/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit




protocol ProjectsCollectionViewDelegate: class {
    func didSelectItemAt(viewModel: ReadySolutionViewModel)
    func openMoreRecomendation()
}

struct CategoryViewModel {
    var label: String
    var desc: String
    var imageUrl: String
    
}


class ProjectsCollectionView: UICollectionView {
    
    static let cellsCount: CGFloat = 13
    weak var projectsDelegate: ProjectsCollectionViewDelegate?
 
    

    var cells = [ReadySolutionViewModel(iconUrlString: "https://blog.wdfiles.com/local--files/files/bitcoin.jpg",
                                        name: "BTC Bitcoin",
                                        desc: "Bitcoin — пиринговая платёжная система, использующая одноимённую единицу для учёта операций. Для обеспечения функционирования и защиты системы используются криптографические методы, но при этом вся информация о транзакциях между адресами системы доступна в открытом виде."),
                 ReadySolutionViewModel(iconUrlString: "https://bitcoinweb.ru/images/eth/ethereum-candels.jpg.pagespeed.ce.TNYw6S8eDE.jpg",
                                        name: "Ethereum",
                                        desc: "Ethereum — платформа для создания децентрализованных онлайн-сервисов на базе блокчейна (децентрализованных приложений), работающих на базе умных контрактов. Реализована как единая децентрализованная виртуальная машина. Был предложен основателем журнала Bitcoin Magazine Виталиком Бутериным в конце 2013 года, сеть была запущена 30 июля 2015 года."),
                 ReadySolutionViewModel(iconUrlString: "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F758979853%2F960x0.jpg%3Ffit%3Dscale",
                                        name: "Litecoin (LTC)",
                                        desc: "Litecoin — форк Bitcoin, пиринговая электронная платёжная система, использующая одноимённую криптовалюту. Litecoin является вторым после Namecoin форком Bitcoin и имеет лишь небольшие отличия от него. По состоянию на 10 ноября 2018 года, 1 LTC эквивалентен 52.02 USD по данным CoinMarketCap и являлся шестой по величине суммарной стоимости криптовалютой."),
                 ReadySolutionViewModel(iconUrlString: "https://cryptocurrencynews.com/wp-content/uploads/sites/3/2018/02/Ripple-Investors-Confidence-Soars-But-Why-Its-CEO-Paints-a-Bleak-Picture-678x381.jpg",
                                        name: "XRP (XRP)",
                                        desc: "Ripple — криптовалютная платформа для платёжных систем, ориентированная на операциях с обменом валют без возвратных платежей. Разработана компанией Ripple[3]. Особенностью является консенсусный реестр (ledger). Система запущена в 2012 году. Протокол поддерживает «токены», представляющие фидуциарные деньги, криптовалюту, биржевые товары или другие объекты, такие как мили часто летающих пассажиров или минуты мобильной связи[4][5]. По своей сути Ripple базируется на открытой разделённой базе данных[6], использует процесс согласования, что позволяет делать обмен в распределённом процессе[7]. Внутренняя криптовалюта сети Ripple именуется XRP."),
                 ReadySolutionViewModel(iconUrlString: "https://privatfinance.com/wp-content/uploads/2018/01/EOS-coin-cryptocurrency.jpg",
                                        name: "EOS (EOS)",
                                        desc: "EOS.IO — блокчейн, оперирующий в качестве децентрализованной платформы с поддержкой смарт-контрактов для создания децентрализованных приложений. Основой блокчейна является криптовалюта EOS. На 26 июля 2018 года EOS, с капитализацией более 7,5 млрд долларов, занимает пятое место по капитализации среди всех криптовалют.В 2019 году агентство Weiss Ratings присвоило криптовалюте наивысшую оценку 'A', за возможность бросить вызов Ethereum в попытке стать «основой нового интернета»."),
                 ReadySolutionViewModel(iconUrlString: "https://coinmania.com/wp-content/uploads/2018/08/TRON-TRX-team-burns-50-million-tokens.jpg",
                                        name: "TRON (TRX)",
                                        desc: "TRON — децентрализованная платформа для развлекательного контента, основанная на блокчейне и использующая токен TRX (Tronix)."),
        
    ]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        setupCollectionSettings()
        setupCollectionHeader()
        setupCollectionViewLayout()
    }
    
    fileprivate func setupCollectionSettings() {
        backgroundColor = .white
        delegate = self
        dataSource = self
        register(ProjectsCollectionViewCell.self, forCellWithReuseIdentifier: ProjectsCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        contentInset = UIEdgeInsets(top: Constants.padding, left: 0, bottom: 0, right: 0)
    }
    
    fileprivate func setupCollectionHeader() {
        register(ProjectsCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProjectsCollectionViewHeader.reuseId)
        
    }
    
    fileprivate func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: Constants.padding, left: Constants.padding, bottom: 0, right: Constants.padding)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension ProjectsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ProjectsCollectionViewCell.reuseId, for: indexPath) as! ProjectsCollectionViewCell
        cell.set(viewModel: cells[indexPath.row])
//
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        projectsDelegate?.didSelectItemAt(viewModel: cells[indexPath.row])
    }
}



// MARK: UICollectionViewDelegateFlowLayout
extension ProjectsCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.frame.width - 60) * 0.5
        let height = width * 0.62
        
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40.0
    }
    
    
    // MARK: add header
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProjectsCollectionViewHeader.reuseId, for: indexPath) as! ProjectsCollectionViewHeader
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let size = CGSize(width: frame.width, height: 250)
        return size
    }
    

}
