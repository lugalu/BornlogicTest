//Created by Lugalu on 12/05/24.

import UIKit

class NewsListCell: UITableViewCell, UITextViewDelegate,ViewCode {
    static let reuseIdentifier = "NewsCell"
    
//    var cellContent: Any = nil
    
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
    
    lazy var authorLabel: UILabel = {
        let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.text = "Lugalu"
        author.font = .systemFont(ofSize: 14, weight: .light)
        
        return author
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
    
    func insertTitle(){
        self.addSubview(titleLabel)
        makeTitleConstraints()
    }
    
    func insertBody() {
        //guard if text exists
        self.addSubview(bodyTextView)
        makeTextConstraints()
    }
    
    
    func insertImage(image:UIImage?) {
        //guard if body text exists
        guard let image else { return }
        bodyImageView.image = image
        self.bodyTextView.addSubview(bodyImageView)
        bodyTextView.textContainer.exclusionPaths = [UIBezierPath(rect:bodyImageView.bounds)]
        makeImageConstraints()
    }
    
    func insertAuthor(){
        //guard if author Exists
        
        //if body doesnt exist we group to title
        self.addSubview(authorLabel)
        makeAuthorConstraints()
    }
    
    func insertLastConstraint(){
        
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
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func makeTextConstraints() {
        let constraints = [
            bodyTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            bodyTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyTextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            bodyTextView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func makeImageConstraints(){
        let constraints = [
            bodyImageView.topAnchor.constraint(equalTo: bodyTextView.topAnchor, constant: 14),
            bodyImageView.leadingAnchor.constraint(equalTo: bodyTextView.leadingAnchor),
            bodyImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 192),
            bodyImageView.heightAnchor.constraint(equalToConstant: 304)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    private func makeAuthorConstraints(){
     
        
        
    }
}
