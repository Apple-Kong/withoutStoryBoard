//
//  ViewController.swift
//  withoutStoryBoard
//
//  Created by GOngTAE on 2022/02/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let test = UILabel()
        view.backgroundColor = .white // 배경색
        view.addSubview(test)
        test.text = "스토리보드가 없어요!" // test를 위해서 출력할 라벨
        test.translatesAutoresizingMaskIntoConstraints = false
        test.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        test.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }


}

