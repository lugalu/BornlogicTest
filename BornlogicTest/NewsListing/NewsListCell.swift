//Created by Lugalu on 12/05/24.

import UIKit

class NewsListCell: UITableViewCell, UITextViewDelegate {
    static let reuseIdentifier = "NewsCell"
        
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .black)
        label.textColor = .accent
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
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
        textView.textColor = .accent
        textView.backgroundColor = .clear
        textView.textContainer.maximumNumberOfLines = 15
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.textContainer.lineFragmentPadding = 2
        
        return textView
    }()
    
    lazy var bodyImageView: UIImageView = {
       let imgView = UIImageView()
        imgView.bounds = CGRect(x: 0, y: 0, width: 200, height: 150)
        imgView.layer.cornerRadius = 5
        imgView.layer.masksToBounds = true
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    lazy var authorLabel: UILabel = {
        let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = .systemFont(ofSize: 18, weight: .light)
        
        return author
    }()

    func setup(news: NewsEntity) {
        if titleLabel.superview == nil{
            contentView.addSubview(titleLabel)
            makeTitleConstraints()
            contentView.addSubview(authorLabel)
            makeAuthorConstraints()
            contentView.addSubview(bodyTextView)
            makeTextConstraints()
            contentView.addSubview(bodyImageView)
            

        }
        self.backgroundColor = .clear
        self.layer.cornerRadius = 10
      
        insertTitle(news.title)
        insertAuthor(author: news.author)
        insertBody(news.description ?? news.content)
        insertImage(image: news.image)

    }
   
    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.isHidden = true
        bodyTextView.isHidden = true
        bodyImageView.isHidden = true
        
        bodyTextView.textContainer.exclusionPaths = []
        
        titleLabel.text = nil
        bodyTextView.text = nil
        bodyImageView.image = nil
        authorLabel.text = "Unknown"
        
    }
    
    func insertTitle(_ title: String?) {
        titleLabel.text = title
        titleLabel.isHidden = false
    }
    
    func insertBody(_ text: String?) {
        guard let text, !text.isEmpty, text.count > 3 else {
            return
        }
        bodyTextView.text = text
        bodyTextView.isHidden = false
    }
    
    
    func insertImage(image:UIImage?) {
        guard let image else { return }
        bodyImageView.image = image
        bodyImageView.isHidden = false
        
        if !bodyTextView.isHidden {
            bodyTextView.textContainer.exclusionPaths = [UIBezierPath(rect:bodyImageView.bounds)]
            makeTextImageConstraints()
            return
        }
        
        makeLooseImageConstraints()
    }
    
    func insertAuthor(author: String?){
        guard let author else {
            return
        }
        authorLabel.text = author
        authorLabel.isHidden = false
    }
    
}




extension NewsListCell{
  
    private func makeTitleConstraints() {
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    private func makeAuthorConstraints(){
        let constraints = [
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    private func makeTextConstraints() {
        let constraints = [
            bodyTextView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            bodyTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyTextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            bodyTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func makeTextImageConstraints(){
        titleLabel.removeConstraints(bodyImageView.constraints)
        authorLabel.removeConstraints(bodyImageView.constraints)
        bodyTextView.removeConstraints(bodyImageView.constraints)
        NSLayoutConstraint.deactivate(bodyImageView.constraints)

        let constraints = [
            bodyImageView.topAnchor.constraint(equalTo: bodyTextView.topAnchor, constant: 14),
            bodyImageView.leadingAnchor.constraint(equalTo: bodyTextView.leadingAnchor),
            bodyImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 190),
            bodyImageView.heightAnchor.constraint(equalToConstant: 150),
            bodyImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func makeLooseImageConstraints(){
        titleLabel.removeConstraints(bodyImageView.constraints)
        authorLabel.removeConstraints(bodyImageView.constraints)
        bodyTextView.removeConstraints(bodyImageView.constraints)
        NSLayoutConstraint.deactivate(bodyImageView.constraints)


        let constraints = [
            bodyImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor,constant: 8),
            bodyImageView.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            bodyImageView.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),
            bodyImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
            bodyImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    

}
