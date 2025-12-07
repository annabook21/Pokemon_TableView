//
//  PokemonDetailViewController.swift
//  PokemonExplorer
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    var pokemon: Pokemon? {
        didSet {
            updateUI()
        }
    }
    
    // UI elements
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 80)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pokemonNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        if #available(iOS 13.0, *) {
            label.textColor = .tertiaryLabel
        } else {
            label.textColor = .lightGray
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        if #available(iOS 13.0, *) {
            label.textColor = .secondaryLabel
        } else {
            label.textColor = .gray
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statsCard: InfoCardView = {
        let card = InfoCardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private let descriptionCard: InfoCardView = {
        let card = InfoCardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private let abilitiesCard: InfoCardView = {
        let card = InfoCardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private let evolutionCard: InfoCardView = {
        let card = InfoCardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        updateUI()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        // smooth rotation
        coordinator.animate(alongsideTransition: { _ in
            self.view.layoutIfNeeded()
        })
    }
    
    private func setupUI() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemGroupedBackground
        } else {
            view.backgroundColor = .groupTableViewBackground
        }
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(emojiLabel)
        contentView.addSubview(pokemonNumberLabel)
        contentView.addSubview(pokemonNameLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(statsCard)
        contentView.addSubview(descriptionCard)
        contentView.addSubview(abilitiesCard)
        contentView.addSubview(evolutionCard)
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupConstraints() {
        let padding: CGFloat = 20
        let cardSpacing: CGFloat = 16
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            emojiLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            emojiLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pokemonNumberLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 8),
            pokemonNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            pokemonNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonNumberLabel.bottomAnchor, constant: 4),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            typeLabel.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: 4),
            typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            statsCard.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 24),
            statsCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            statsCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            descriptionCard.topAnchor.constraint(equalTo: statsCard.bottomAnchor, constant: cardSpacing),
            descriptionCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            descriptionCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            abilitiesCard.topAnchor.constraint(equalTo: descriptionCard.bottomAnchor, constant: cardSpacing),
            abilitiesCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            abilitiesCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            evolutionCard.topAnchor.constraint(equalTo: abilitiesCard.bottomAnchor, constant: cardSpacing),
            evolutionCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            evolutionCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            evolutionCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }
    
    private func updateUI() {
        guard isViewLoaded, let pokemon = pokemon else { return }
        emojiLabel.text = pokemon.imageEmoji
        pokemonNumberLabel.text = "#\(String(format: "%03d", pokemon.number))"
        pokemonNameLabel.text = pokemon.name
        typeLabel.text = pokemon.type
        
        let statsText = "Category: \(pokemon.category)\nHeight: \(pokemon.height)\nWeight: \(pokemon.weight)"
        statsCard.configure(title: "Stats", content: statsText, icon: "📊")
        descriptionCard.configure(title: "About", content: pokemon.description, icon: "ℹ️")
        abilitiesCard.configure(title: "Abilities", content: pokemon.abilities, icon: "⚡")
        evolutionCard.configure(title: "Evolution", content: pokemon.evolution, icon: "🔄")
        
        navigationItem.title = pokemon.name
    }
}

// reusable info card component
class InfoCardView: UIView {
    
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        if #available(iOS 13.0, *) {
            view.backgroundColor = .secondarySystemGroupedBackground
        } else {
            view.backgroundColor = .white
        }
        // subtle shadow
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.05
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        if #available(iOS 13.0, *) {
            label.textColor = .label
        } else {
            label.textColor = .black
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        if #available(iOS 13.0, *) {
            label.textColor = .secondaryLabel
        } else {
            label.textColor = .darkGray
        }
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(containerView)
        containerView.addSubview(iconLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            iconLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            iconLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            titleLabel.centerYAnchor.constraint(equalTo: iconLabel.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconLabel.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            contentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            contentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            contentLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
        ])
    }
    
    func configure(title: String, content: String, icon: String) {
        iconLabel.text = icon
        titleLabel.text = title
        contentLabel.text = content
    }
}

