//
//  ViewController.swift
//  withoutStoryBoard
//
//  Created by GOngTAE on 2022/02/16.
//

import UIKit
import SnapKit



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
                cell.textlabel.text = String(indexPath.row + 1)
        
        cell.backgroundColor = .blue
        
        return cell
    }
    
    
}

//MARK: - 컬렉션 뷰 레이아웃 수정
extension  ViewController: UICollectionViewDelegateFlowLayout {

    //행
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    //행간 높이
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //사이즈 조정

        let width = 60
        let height = 60
        let size = CGSize(width: width, height: height)
        return size
    }
}

class ViewController: UIViewController {
    let button = UIButton()
    let slider = UISlider()
    let label = UILabel()
    let button2 = UIButton()
    let partialView = UIView()
    let messageLabel = UILabel()
    
    
    
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    
    private var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white // 배경색
        
        
        configureTestButton()
        configureSlider()
        configureView()
        configureButton2()
        configureUI()
        configureStackView()
        
        setupCollectionView()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
    
    func setupCollectionView() {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        self.collectionView = cv
        
        self.view.addSubview(collectionView)
            
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(messageLabel.snp.bottom)
            make.bottom.equalTo(slider.snp.top).offset(-80)
        }
        collectionView.backgroundColor = .systemPink
        
        self.collectionView = cv
    }

    
    @objc func printLog(_ sender: UIButton) {
        

    }

    
    
    func configureUI() {
        view.addSubview(label)
        label.text = "공태현" // test를 위해서 출력할 라벨
        label.font = .boldSystemFont(ofSize: 28)
        label.snp.makeConstraints { make in
            make.centerX.equalTo(button2)
            make.top.equalTo(self.button2.snp.bottom).offset(20)
        }
        
        
        view.addSubview(messageLabel)
        
        messageLabel.text = "상태메세지"
        messageLabel.textColor = .black
        
        messageLabel.font = .systemFont(ofSize: 18)
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalTo(label)
            make.top.equalTo(label.snp.bottom).offset(30)
        }
        
    }
    
    func configureStackView() {
               
        func customizeButton(make: UIButton) {
           
            make.setTitle("wow", for: .normal)
            make.titleLabel?.font = .boldSystemFont(ofSize: 20)
            make.backgroundColor = .link
            make.layer.cornerRadius = 20
            
        }
        
        customizeButton(make: button3)
        customizeButton(make: button4)
        customizeButton(make: button5)
        
        let stackView = UIStackView(arrangedSubviews: [button3, button4, button5])
        
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)

        
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(slider)
            make.height.equalTo(50)
            make.bottom.equalTo(slider.snp.top).offset(-20)
            make.centerX.equalTo(slider)
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



class CollectionViewCell: UICollectionViewCell {
    
    weak var textlabel: UILabel!
    static let identifier: String = String(describing: CollectionViewCell.self)
   
    override init(frame: CGRect) {
       super.init(frame: frame)
       
       let label = UILabel()
      
       contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalTo(contentView)
        }
        
       
       textlabel = label
       contentView.backgroundColor = .lightGray
       textlabel.textAlignment = .center
       
    }
   
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
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
