//
//  ViewController.swift
//  withoutStoryBoard
//
//  Created by GOngTAE on 2022/02/16.
//

import UIKit
import SnapKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        let label = UILabel()
        view.backgroundColor = .white // 배경색
        view.addSubview(label)
        label.text = "스토리보드가 없어요!" // test를 위해서 출력할 라벨
        label.font = .boldSystemFont(ofSize: 30)

        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        configureTestButton()
        configureSlider()
        
    }
    
    func configureTestButton() {
        let button = UIButton()
        button.setTitle("내가 만든 버튼", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .link
        button.layer.cornerRadius = 10

        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalTo(self.view).offset(-30)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
        }
    }
    
    func configureSlider() {
        let slider = UISlider()
        slider.maximumValue = 10
        slider.minimumValue = 0
        slider.value = 5
        
        
        view.addSubview(slider)
        slider.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-100)
        }
    }


}



//canvas 사용을 위한 코드


import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
