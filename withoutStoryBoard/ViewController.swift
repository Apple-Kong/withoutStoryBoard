//
//  ViewController.swift
//  withoutStoryBoard
//
//  Created by GOngTAE on 2022/02/16.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    let button = UIButton()
    let slider = UISlider()
    let label = UILabel()
    let button2 = UIButton()
    let partialView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white // 배경색
        view.addSubview(label)
        label.text = "스토리보드가 없어요!" // test를 위해서 출력할 라벨
        label.font = .boldSystemFont(ofSize: 30)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        configureTestButton()
        configureSlider()
        configureView()
        configureButton2()
    }
    
    @objc func printLog(_ sender: UIButton) {
        
        print("button clicked")
        button.snp.updateConstraints { make in
            make.height.equalTo(100)
        }
    }
    
    func configureView() {
        partialView.backgroundColor = .blue
        
        view.addSubview(partialView)
        partialView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(-44)
            make.height.equalTo(244)
        }
    }
    
    func configureButton2() {
        button2.imageView?.image = UIImage(systemName: "plus")
        button2.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button2.backgroundColor = .link
        button2.layer.cornerRadius = 140 / 2
        button2.addTarget(self, action: #selector(printLog(_:)), for: .touchUpInside)
        
        
        view.addSubview(button2)
        button2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.partialView.snp.bottom).offset(-70)
            make.height.width.equalTo(140)
        }
        
    }
    
    func configureTestButton() {
        button.setTitle("내가 만든 버튼", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .link
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(printLog(_:)), for: .touchUpInside)
        
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.bottom.equalTo(self.view).offset(-30)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
        }
    }
    
    func configureSlider() {
        
        slider.maximumValue = 10
        slider.minimumValue = 0
        slider.value = 5
        
        view.addSubview(slider)
        slider.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.button)
            make.bottom.equalTo(self.button.snp.top).offset(-10)
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
.previewInterfaceOrientation(.portrait)
    }
}
