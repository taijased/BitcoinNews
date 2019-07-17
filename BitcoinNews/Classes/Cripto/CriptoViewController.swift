//
//  CriptoViewController.swift
//  BitcoinNews
//
//  Created by Maxim Spiridonov on 16/07/2019.
//  Copyright © 2019 Maxim Spiridonov. All rights reserved.
//
import UIKit
import RxSwift
import RxCocoa

class CriptoViewController: UIViewController, StoryboardInitializable {
    
    let disposeBag = DisposeBag()
    var viewModel: CriptoViewModel!
    
  
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
              imageView.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textView: UILabel!
    @IBAction func closeCriptoDetali(_ sender: UIButton) {
        sender.flash()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    fileprivate func setData() {
        self.textView.text = self.viewModel.data.desc
        self.labelName.text = self.viewModel.data.name
        let url = URL(string: viewModel.data.iconUrlString)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data!)
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
