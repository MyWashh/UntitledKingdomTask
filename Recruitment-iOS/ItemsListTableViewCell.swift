import UIKit

class ItemsListTableViewCell: UITableViewCell {
    let nameLabel = UILabel()
    let previewTextLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true

        addSubview(previewTextLabel)
        previewTextLabel.numberOfLines = 0
        previewTextLabel.translatesAutoresizingMaskIntoConstraints = false
        previewTextLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        previewTextLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        previewTextLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        previewTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        previewTextLabel.backgroundColor = .clear
    }
}
