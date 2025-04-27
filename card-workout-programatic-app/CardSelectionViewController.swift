//
//  CardSelectionViewController.swift
//  card-workout-programatic-app
//
//  Created by NTIPL on 27/04/25.
//

import UIKit

class CardSelectionViewController: UIViewController {
    
    let cardImageView = UIImageView()
    let stopButton = CWButton(color: .systemRed, title: "Stop!", buttonIconName: "stop.circle")
    let resetButton = CWButton(color: .systemGreen, title: "Reset", buttonIconName: "arrow.clockwise.circle")
    let rulesButton = CWButton(color: .systemBlue, title: "Rules", buttonIconName: "list.dash")
    
    var cards: [UIImage] = CardDeck.allCards
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(shuffelCards), userInfo: nil, repeats: true)
    }
    
    @objc func shuffelCards(){
        cardImageView.image = cards.randomElement()
    }
    
    @objc func stopTimer(){
        timer?.invalidate()
    }
    
    @objc func resetTimer(){
        stopTimer()
        startTimer()
    }
    
    @objc func presentRules(){
        present(RulesViewController(), animated: true)
    }
    
    func configureUI(){
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
    
    func configureCardImageView(){
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton(){
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func configureResetButton(){
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)

        NSLayoutConstraint.activate([
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRules), for: .touchUpInside)

        NSLayoutConstraint.activate([
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
}
