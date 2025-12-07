//
//  PokemonTableViewController.swift
//  PokemonExplorer
//

import UIKit

class PokemonTableViewController: UITableViewController {
    
    private let pokemon = PokemonDataManager.shared.pokemon
    private let cellIdentifier = "PokemonCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
    }
    
    private func setupUI() {
        title = "Pokédex"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // dark mode support
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
            tableView.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
            tableView.backgroundColor = .white
        }
    }
    
    private func setupTableView() {
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView()
    }
    
    // TableView data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PokemonTableViewCell
        let poke = pokemon[indexPath.row]
        cell.configure(with: poke)
        return cell
    }
    
    // Handle cell selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedPokemon = pokemon[indexPath.row]
        
        // pass data to detail view
        let detailVC = PokemonDetailViewController()
        detailVC.pokemon = selectedPokemon
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // tap animation
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            UIView.animate(withDuration: 0.1) {
                cell.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            UIView.animate(withDuration: 0.1) {
                cell.transform = .identity
            }
        }
    }
}

// Custom cell for pokemon list
class PokemonTableViewCell: UITableViewCell {
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let pokemonNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        if #available(iOS 13.0, *) {
            label.textColor = .tertiaryLabel
        } else {
            label.textColor = .lightGray
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        if #available(iOS 13.0, *) {
            label.textColor = .secondaryLabel
        } else {
            label.textColor = .gray
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: "chevron.right")
            imageView.tintColor = .tertiaryLabel
        } else {
            imageView.image = UIImage(named: "chevron")
            imageView.tintColor = .lightGray
        }
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    private func setupCell() {
        if #available(iOS 13.0, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .white
        }
        contentView.addSubview(emojiLabel)
        contentView.addSubview(stackView)
        contentView.addSubview(chevronImageView)
        
        stackView.addArrangedSubview(pokemonNumberLabel)
        stackView.addArrangedSubview(pokemonNameLabel)
        stackView.addArrangedSubview(typeLabel)
        
        // layout constraints
        NSLayoutConstraint.activate([
            emojiLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emojiLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            emojiLabel.widthAnchor.constraint(equalToConstant: 50),
            stackView.leadingAnchor.constraint(equalTo: emojiLabel.trailingAnchor, constant: 12),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor, constant: -12),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            chevronImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            chevronImageView.widthAnchor.constraint(equalToConstant: 12),
            chevronImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(with pokemon: Pokemon) {
        emojiLabel.text = pokemon.imageEmoji
        pokemonNumberLabel.text = "#\(String(format: "%03d", pokemon.number))"
        pokemonNameLabel.text = pokemon.name
        typeLabel.text = pokemon.type
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        emojiLabel.text = nil
        pokemonNumberLabel.text = nil
        pokemonNameLabel.text = nil
        typeLabel.text = nil
    }
}

