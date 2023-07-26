//
//  ViewController.swift
//  emotionProject
//
//  Created by 염성필 on 2023/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    enum BtnClickCount: Int {
        case fullSmile
        case smile
        case normal
        case sad
        case alotOfSad
    }
    
    @IBOutlet var menuBtn: UIButton!
    
    @IBOutlet var exampleLabel: UILabel!
    
    
    var btnClickAddCount: [Int:Int] = [0:0,
                                       1:0,
                                       2:0,
                                       3:0,
                                       4:0
    ]
    
    // MARK: - 생명주기 확인
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController - viewDidLoad")
        settingMenuBtn()
        
        guard let userDefaultsDic = UserDefaultsManager.shared.loadData(key: "btnClickAddCount") else { return }
        
        btnClickAddCount = userDefaultsDic
        
        print("딕셔너리 UserDefaults",btnClickAddCount)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController - viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController - viewDidDisappear")
        
        
    }
    
    
    
    
    // MARK: - 감정 클릭시
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        btnClickAddCount[sender.tag] = btnClickAddCount[sender.tag]! + 1
        
        
        
        switch sender.tag {
        case BtnClickCount.fullSmile.rawValue:
            print("완전 행복지수",btnClickAddCount[sender.tag] ?? 0)
        case BtnClickCount.smile.rawValue:
            print("행복지수",btnClickAddCount[sender.tag] ?? 0)
        case BtnClickCount.normal.rawValue:
            print("보통임",btnClickAddCount[sender.tag] ?? 0)
        case BtnClickCount.sad.rawValue:
            print("슬픔",btnClickAddCount[sender.tag] ?? 0)
        case BtnClickCount.alotOfSad.rawValue:
            print("완전 슬픔",btnClickAddCount[sender.tag] ?? 0)
        default:
            print("값이 없음")
        }
        
        print("btnClickAddCount",btnClickAddCount)
        
        UserDefaultsManager.shared.saveData(btnClickAddCount)
    }
    
    
    // MARK: - Menu 버튼 클릭시
    @IBAction func memuButtonClicked(_ sender: UIButton) {
        print("menu 버튼 눌림")
        
        let plusOne = allBtnCountIncrease(addCount: 1)
        let plusFive = allBtnCountIncrease(addCount: 5)
        let plusTen = allBtnCountIncrease(addCount: 10)
        
        let buttonMenu = UIMenu(title: "메뉴 타이틀", children: [plusOne, plusFive, plusTen])
        print("btnClickAddCount",btnClickAddCount)
        
       

        menuBtn.menu = buttonMenu
    }
    
    // Menu 버튼 셋팅하기, 길게 눌렀을때만 Menu 실행
    func settingMenuBtn() {
        menuBtn.showsMenuAsPrimaryAction = false
        menuBtn.changesSelectionAsPrimaryAction = true
    }
    
    func allBtnCountIncrease(addCount: Int) -> UIAction {
        let addCountBtn = UIAction(title: "모든 카운트 증가 + \(addCount)", handler: { [weak self] _ in
            guard let self = self else { return }
            for i in 0..<btnClickAddCount.count {
                btnClickAddCount[i] = btnClickAddCount[i]! + addCount
                
            }
            print("모든 버튼 + \(addCount) 증가 ",btnClickAddCount)
            UserDefaultsManager.shared.saveData(btnClickAddCount)
        })
        return addCountBtn
    }
    
    
}

extension UserDefaults {
    func object<T: Codable>(_ type: T.Type, with key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
        guard let data = self.value(forKey: key) as? Data else { return nil }
        return try? decoder.decode(type.self, from: data)
    }
    
    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
        let data = try? encoder.encode(object)
        self.set(data, forKey: key)
    }
}


