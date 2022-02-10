//
//  MagicViewController.swift
//  MagicBall
//
//  Created by Vladimir Fibe on 09.02.2022.
//

import UIKit

class MagicViewController: UIViewController {
  let magicView: UIImageView = {
    let image = UIImageView(image: UIImage(named: "Ball"))
    image.contentMode = .scaleAspectFill
    return image
  }()

  let answerLabel = UILabel()

  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Шар судьбы"
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
    return label
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    answerLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
    answerLabel.text = ""
    view.addSubview(magicView)
    magicView.translatesAutoresizingMaskIntoConstraints = false
    magicView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    magicView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    magicView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
    magicView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
 
    view.addSubview(answerLabel)
    answerLabel.textColor = .black
    answerLabel.numberOfLines = 0
    answerLabel.textAlignment = .center
    answerLabel.translatesAutoresizingMaskIntoConstraints = false
    answerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    answerLabel.topAnchor.constraint(equalTo: magicView.bottomAnchor, constant: 50).isActive = true
    answerLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    
    view.addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: magicView.topAnchor, constant: -50).isActive = true
  }
  
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      answer()
    }
  }
  
  func answer() {
    answerLabel.text = answers.randomElement()
    print(answerLabel.text!)
  }
  
  let answers = [
    "Бесспорно",
    "Предрешено",
    "Никаких сомнений",
    "Определённо да",
    "Можешь быть уверен в этом",
    "Мне кажется — да",
    "Вероятнее всего",
    "Хорошие перспективы",
    "Знаки говорят — да",
    "Да",
    "Пока не ясно, попробуй снова",
    "Спроси позже",
    "Лучше не рассказывать",
    "Сейчас нельзя предсказать",
    "Сконцентрируйся и спроси опять",
    "Даже не думай",
    "Мой ответ — нет",
    "По моим данным — нет",
    "Перспективы не очень хорошие",
    "Весьма сомнительно"
  ]
}
