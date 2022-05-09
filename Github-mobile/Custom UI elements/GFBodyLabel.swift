//
//  GFBodyLabel.swift
//  Github-mobile
//
//  Created by Muller Alexander on 05.05.2022.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAligment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAligment
        configure()
    }
    
    private func configure() {
        textColor = .secondaryLabel
        font = .preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75 // Минимально допустимая пропорция для уменьшения размера шрифта, чтобы текст вписался в доступное пространство
        lineBreakMode = .byWordWrapping // Техника переноса и обрезания текста этикетки.
        translatesAutoresizingMaskIntoConstraints = false
    }
}
