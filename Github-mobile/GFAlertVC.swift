//
//  GFAlertVC.swift
//  Github-mobile
//
//  Created by Muller Alexander on 05.05.2022.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView = UIView(frame: .zero)
    let titleLabel = GFTitleLabel(textAligment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAligment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}

extension GFAlertVC {
    func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        //        NSLayoutConstraint.activate([
        //            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        //            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //            containerView.widthAnchor.constraint(equalToConstant: 280),
        //            containerView.heightAnchor.constraint(equalToConstant: 220)
        //        ])
        
        containerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(220)
        }
    }
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        //        NSLayoutConstraint.activate([
        //            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
        //            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
        //            containerView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: padding),
        //            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        //        ])
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(padding)
            make.leading.equalTo(containerView.snp.leading).offset(padding)
            make.trailing.equalTo(containerView.snp.trailing).inset(padding)
            make.height.equalTo(28)
        }
    }
    
    func configureActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        //        NSLayoutConstraint.activate([
        //            containerView.bottomAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: padding),
        //            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
        //            containerView.trailingAnchor.constraint(equalTo: actionButton.trailingAnchor, constant: padding),
        //            actionButton.heightAnchor.constraint(equalToConstant: 44)
        //        ])
        
        actionButton.snp.makeConstraints { make in
            make.bottom.equalTo(containerView.snp.bottom).inset(padding)
            make.leading.equalTo(containerView.snp.leading).offset(padding)
            make.trailing.equalTo(containerView.snp.trailing).inset(padding)
            make.height.equalTo(44)
        }
    }
    
    func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 4
        
        //        NSLayoutConstraint.activate([
        //            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
        //            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
        //            containerView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: padding),
        //            actionButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 12)
        //        ])
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(containerView.snp.leading).offset(padding)
            make.trailing.equalTo(containerView.snp.trailing).inset(padding)
            make.bottom.equalTo(actionButton.snp.top).inset(12)
        }
    }
}
