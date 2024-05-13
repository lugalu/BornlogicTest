//Created by Lugalu on 12/05/24.

import UIKit

class NewsListCell: UITableViewCell, UITextViewDelegate,ViewCode {
    static let reuseIdentifier = "NewsCell"
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .black)
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting"
        label.textColor = .accent
        label.numberOfLines = 3
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    
    lazy var bodyTextView: UITextView = {
        var textView = UITextView()
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = true
        textView.isUserInteractionEnabled = false
        
        textView.font = .systemFont(ofSize: 22, weight: .medium)
        textView.text = """
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
        """
        textView.textColor = .accent
        textView.backgroundColor = .clear
        textView.textContainer.maximumNumberOfLines = 15
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.textContainer.lineFragmentPadding = 2
        
        return textView
    }()
    
    lazy var bodyImageView: UIImageView = {
       let imgView = UIImageView()
        imgView.bounds = CGRect(x: 0, y: 0, width: 200, height: 300)
        imgView.layer.cornerRadius = 5
        imgView.layer.masksToBounds = true
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 10
        setupViews()
        setupConstraints()
    }
    
    func insertImage(image:UIImage?){
        guard let image else { return }
        bodyImageView.image = image
        self.bodyTextView.addSubview(bodyImageView)
        bodyTextView.textContainer.exclusionPaths = [UIBezierPath(rect:bodyImageView.bounds)]
        makeImageConstraints()
    }

    
}




extension NewsListCell{
    func setupViews() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(bodyTextView)
    }
    
    func setupConstraints() {
        makeTitleConstraints()
        makeTextConstraints()
    }
    
    private func makeTitleConstraints() {
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func makeTextConstraints() {
        let constraints = [
            bodyTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            bodyTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyTextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            bodyTextView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func makeImageConstraints(){
        let constraints = [
            bodyImageView.topAnchor.constraint(equalTo: bodyTextView.topAnchor, constant: 14),
            bodyImageView.leadingAnchor.constraint(equalTo: bodyTextView.leadingAnchor),
            bodyImageView.widthAnchor.constraint(equalToConstant: bodyImageView.bounds.width),
            bodyImageView.heightAnchor.constraint(equalToConstant: bodyImageView.bounds.height)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
