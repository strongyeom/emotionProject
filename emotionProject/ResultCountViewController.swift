//
//  ResultCountViewController.swift
//  emotionProject
//
//  Created by 염성필 on 2023/07/25.
//

import UIKit

class ResultCountViewController: UIViewController {
    
    @IBOutlet var resultCountCollection: [UILabel]!

    var resultCount: [Int:Int] = [:]
    // MARK: - 뷰 생명 주기
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        print("ResultCountViewController - viewDidLoad")
        
    }
    
    // 트리거 역할 reload 해준다.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ResultCountViewController - viewWillAppear")
        
        let userDefaultsDic = UserDefaultsManager.shared.loadData(key: "btnClickAddCount")
        
        if let userDefaultsDic = userDefaultsDic {
            resultCount = userDefaultsDic
        } else {
            resultCount = [0:0]
        }
        
        
        applyCount()
        print("ResultCountViewController - resultCount",resultCount)
    }
    
    func applyCount() {
        for index in 0..<resultCountCollection.count {
            resultCountCollection[index].text = "\(resultCount[index] ?? 0)점"
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ResultCountViewController - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ResultCountViewController - viewWillDisappear")
       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ResultCountViewController - viewDidDisappear")
    }
    
    
    func configureLabel() {
        for label in resultCountCollection {
            label.settingSizeLabel()
        }
    }

}

extension UILabel {
    func settingSizeLabel() {
        self.font = UIFont.systemFont(ofSize: 40, weight: .light)
    }
}
