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
        test.font = UIFont.systemFont(ofSize: 30)
        
        test.translatesAutoresizingMaskIntoConstraints = false
        test.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        test.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        configureTestButton()
        configureSlider()
        
    }
    
    func configureTestButton() {
        let button = UIButton()
        button.setTitle("내가 만든 버튼", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .link
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        
        view.addSubview(button)
        
        let safeArea = view.safeAreaLayoutGuide
        
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20).isActive = true
        button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        
    }
    
    func configureSlider() {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.maximumValue = 10
        slider.minimumValue = 0
        slider.value = 5
        
        
        view.addSubview(slider)
        
        let safeArea = view.safeAreaLayoutGuide
        
        let leading = NSLayoutConstraint(item: slider, attribute: .leading, relatedBy: .equal, toItem: safeArea, attribute: .leading, multiplier: 1, constant: 20)
        let trailing = NSLayoutConstraint(item: slider, attribute: .trailing, relatedBy: .equal, toItem: safeArea, attribute: .trailing, multiplier: 1, constant: -20)
        let bottom = NSLayoutConstraint(item: slider, attribute: .bottom, relatedBy: .equal, toItem: safeArea, attribute: .bottom, multiplier: 1, constant: -100)
        
        NSLayoutConstraint.activate([leading, trailing, bottom])
        
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
