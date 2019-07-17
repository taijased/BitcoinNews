//
//  ReadySolutionCollectionView.swift
//  ARI
//
//  Created by Maxim Spiridonov on 25/05/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//

import UIKit


struct ReadySolutionViewModel {
    var iconUrlString: String
    var name: String
    var desc: String
}



protocol ReadySolutionCollectionViewDelegate: class {
    func didSelectItemAt(cellViewModel: ReadySolutionViewModel)
}


class ReadySolutionCollectionView: UICollectionView {
    
    weak var solutionDelegate: ReadySolutionCollectionViewDelegate?
    
    let itemCellsGap: CGFloat = 20.0
    
    
    let refControl = UIRefreshControl()
 
    var cells = [
                ReadySolutionViewModel(iconUrlString: "https://storage.googleapis.com/telesite-prod/photos/4d59dd50-a310-11e9-bdb1-cb5e0676f0a5.jpeg",
                               name: "Настоящая угроза биткоину",
                               desc: "Принято считать, что Сатоши Накамото создал биткоин с целью освободить людей от банков. Он придумал и реализовал на практике, как люди могут сами владеть своими деньгами без необходимости обращаться к посредникам в виде финансовых учреждений. А ограниченное количество биткоинов делают его настолько ценным активом, что цена может превзойти все мыслимые и немыслимые рекорды. И если в прогнозы по миллиону долларов за один биткоин пока еще верится с трудом. То к цифрам $100000 и $200000 все уже давно привыкли и считают, что просто нужно немного подождать."),
                ReadySolutionViewModel(iconUrlString: "https://storage.googleapis.com/telesite-prod/photos/8c946200-a47e-11e9-bdb1-cb5e0676f0a5.jpeg",
                                        name: "Майнинг на смартфоне: правда или вымысел?",
                                        desc: "По мере развития индустрии криптовалют, майнинг в 2019 году привлекает все больше людей. Но большую часть из них останавливает то, что добыча требует покупки серьёзного оборудования. Сложность майнинга популярных криптовалют растет с каждым днем, и даже с одной видеокартой или хорошим процессором получить заветный токен становится проблематично. На волне тренда к майнингу решили подключиться и разработчики приложений для мобильных устройств."),
                ReadySolutionViewModel(iconUrlString: "https://tgraph.io/file/5ea8e82f910bf45d3c92d.jpg",
                                       name: "Биткоин: идеальный актив на случай новой 'Великой депрессии'",
                                       desc: "Вывод Grayscale: «Беря во внимание продолжение распространения [в экономике], Биткоин представляет собой прозрачную, неизменную и глобальную форму ликвидности, которая может обеспечить сохранение ценности и обладает возможностями для ее роста. Поэтому мы убеждены в том, что он заслуживает стратегического положения в рамках долгосрочного инвестиционного портфеля»."),
                 ReadySolutionViewModel(iconUrlString: "https://storage.googleapis.com/telesite-prod/photos/491e3fc0-a850-11e9-bdb1-cb5e0676f0a5.jpeg",
                                        name: "Почему биткоин не вырос после попадания в Twitter Дональда Трампа?",
                                        desc: "Уже все успели высказаться насчет того как Трамп твитнул о биткоине, а глава Федеральной резервной системы США Джером Пауэлл вообще назвал первую криптовалюту альтернативной золоту? Ажиотажа о данной новости было крайне много, ведь сам Дональд Трамп написал о биткоине, вот только цена почему-то не выросла. А потом вообще рынок пошел вниз, что особенно сказалось на альткоинах. Давайте разберемся, о чем на самом деле заявили Дональд Трамп и Джером Пауэлл и как так получилось, что рынок фактически проигнорировал такое событие."),
                 ReadySolutionViewModel(iconUrlString: "https://storage.googleapis.com/telesite-prod/photos/eebe29b0-9a4d-11e9-bdb1-cb5e0676f0a5.jpeg",
                                        name: "Криптовалюта Maker (MKR): обзор и перспективы",
                                        desc: "Криптовалюта Maker – это криптовалютная платформа, созданная в 2015 году на основе блокчейна Ethereum. Основная цель проекта – создать децентрализованную валюту, привязанную к реальным активам, таким как доллар, евро, фунты, золото и так далее. Если говорить проще, то речь идет о так называемых стейблкоинах."),
                 ReadySolutionViewModel(iconUrlString: "https://storage.googleapis.com/telesite-prod/photos/e7003220-a85f-11e9-bdb1-cb5e0676f0a5.jpeg",
                                        name: "Tether случайно создал 5 млрд лишних USDT",
                                        desc: "Эмитент стабильной монеты Tether случайно создал 5 млрд USDT в эти выходные, после чего незамедлительно их уничтожил. Данный курьезный случай произошел, когда компания помогала криптовалютной бирже, Poloniex проводить переход с одного блокчейна на другой — из Omni в Tron. Об этом рассказал Паоло Ардоино, технический директор Tether."),
                 
             ]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .clear
        setupCollectionSettings()

        // Setup Pull to Refresh
        setupPullToRefresh()
    }
    
    
    
    func set(cells: [ReadySolutionViewModel]) {
        self.cells = cells
    }
    
//    var refreshControl: UIRefreshControl = {
//        return UIRefreshControl()
//    }()
    
    private func setupPullToRefresh() {
        
        
        refControl.attributedTitle = NSAttributedString(string: "", attributes: [.foregroundColor: UIColor.white])
        refControl.backgroundColor = .white
        refControl.tintColor = UIColor(hexValue: "#EB5777", alpha: 1)
        refControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        addSubview(refControl)
        
    }
    
    @objc func refresh() {
        print(#function)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.refControl.endRefreshing()
        }
    }
    
    
    private func setupCollectionSettings() {
        delegate = self
        dataSource = self
        register(ReadySolutionCollectionViewCell.self, forCellWithReuseIdentifier: ReadySolutionCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 30, left: 16, bottom: 50, right: 16)
        isPagingEnabled = true
        decelerationRate = .fast
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension ReadySolutionCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ReadySolutionCollectionViewCell.reuseId, for: indexPath) as! ReadySolutionCollectionViewCell
        cell.set(viewModel: cells[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        solutionDelegate?.didSelectItemAt(cellViewModel: cells[indexPath.row])
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension ReadySolutionCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: frame.width - 32, height: frame.width / 1.5)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemCellsGap
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return itemCellsGap
    }

}
