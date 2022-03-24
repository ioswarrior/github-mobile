//
//  SearchVC.swift
//  Github-mobile
//
//  Created by Muller Alexander on 23.03.2022.
//

import UIKit
import SnapKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC() {
        
        guard isUsernameEntered else {
            print("No username")
            return
        }
        
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        //        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        //        NSLayoutConstraint.activate([
        //            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
        //            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //            logoImageView.heightAnchor.constraint(equalToConstant: 200),
        //            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        //        ])
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        
        //        NSLayoutConstraint.activate([
        //            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
        //            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        //            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        //            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        //        ])
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(48)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        //        NSLayoutConstraint.activate([
        //            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        //            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        //            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        //            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        //        ])
        
        callToActionButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
