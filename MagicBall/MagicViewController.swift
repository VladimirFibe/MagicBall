//
//  MagicViewController.swift
//  MagicBall
//
//  Created by Vladimir Fibe on 09.02.2022.
//

import SwiftUI

class MagicViewController: UIViewController {
  let magicView: UIImageView = {
    let image = UIImageView(image: UIImage(named: "Ball"))
    image.contentMode = .scaleAspectFill
    image.isUserInteractionEnabled = true
    return image
  }()

  let answerLabel: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textColor = .black
    label.font = .systemFont(ofSize: 50, weight: .bold)
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }()

  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Шар судьбы"
    label.textColor = .black
    label.font = .systemFont(ofSize: 50, weight: .bold)
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    view.addSubview(magicView)
    view.addSubview(answerLabel)
    view.addSubview(titleLabel)
    let tapGestureRecognizer = UITapGestureRecognizer(
      target: self,
      action: #selector(imageTapped(tapGestureRecognizer:)))
    magicView.addGestureRecognizer(tapGestureRecognizer)
    setupConstraints()
  }
  
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {  answer() }
  }
  
  @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
      answer()
  }
  func answer() {
    answerLabel.text = answers.randomElement()
  }
  
  func setupConstraints() {
    magicView.translatesAutoresizingMaskIntoConstraints = false
    magicView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    magicView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    magicView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
    magicView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true

    answerLabel.translatesAutoresizingMaskIntoConstraints = false
    answerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    answerLabel.topAnchor.constraint(equalTo: magicView.bottomAnchor, constant: 50).isActive = true
    answerLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: magicView.topAnchor, constant: -50).isActive = true
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

struct SwiftUIController: UIViewControllerRepresentable {
  typealias UIViewControllerType = MagicViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    let viewController = UIViewControllerType()
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
}

struct SwiftUIController_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIController()
      .edgesIgnoringSafeArea(.all)
  }
}

