//Created by Lugalu on 12/05/24.

import UIKit

class NewsListCell: UITableViewCell, UITextViewDelegate {
    static let reuseIdentifier = "NewsCell"
        
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        textView.text = "Descrição não disponivel"

        
        return textView
    }()
    
    lazy var bodyImageView: UIImageView = {
       let imgView = UIImageView()
        imgView.bounds = CGRect(x: 0, y: 0, width: 200, height: 150)
        imgView.layer.cornerRadius = 5
        imgView.layer.masksToBounds = true
        imgView.contentMode = .scaleAspectFill
        imgView.isHidden = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    lazy var authorLabel: UILabel = {
        let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = .systemFont(ofSize: 18, weight: .light)
        author.text = "Desconhecido"
        
        return author
    }()
    
    lazy var sizeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var sizeViewTopTextConstraint: NSLayoutConstraint = NSLayoutConstraint(item: sizeView, attribute: .top, relatedBy: .equal, toItem: bodyTextView, attribute: .bottom, multiplier: 1, constant: 0)
    lazy var sizeViewTopImageConstraint: NSLayoutConstraint = NSLayoutConstraint(item: sizeView, attribute: .top, relatedBy: .equal, toItem: bodyImageView, attribute: .bottom, multiplier: 1, constant: 0)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        self.backgroundColor = .clear
        self.selectionStyle = .none
        contentView.addSubview(container)
        
        container.addSubview(titleLabel)
        container.addSubview(authorLabel)
        container.addSubview(bodyTextView)
        container.addSubview(bodyImageView)
        container.addSubview(sizeView)
        
        makeContainerConstraints()

        makeTitleConstraints()
        makeAuthorConstraints()
        makeTextConstraints()
        makeTextImageConstraints()
        let constraints = [
            //sizeView.topAnchor.constraint(equalTo: bottom.bottomAnchor),
            sizeView.heightAnchor.constraint(equalToConstant: 8),
            sizeView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    

    func setup(content: NewsEntity) {
        insertTitle(content.title)
        insertAuthor(author: content.author)
        insertBody(content.description ?? content.content)
        insertImage(image: content.image)
        
    }
   
    override func prepareForReuse() {

        super.prepareForReuse()

        bodyImageView.isHidden = true
        
        bodyTextView.textContainer.exclusionPaths = []
        
        titleLabel.text = nil
        bodyTextView.text = "Descrição não disponivel"
        bodyImageView.image = nil
        authorLabel.text = "Unknown"
        
    }
    override func didMoveToWindow() {
        super.didMoveToWindow()
        makeSizeViewConstraints()

    }
    
    func insertTitle(_ title: String?) {
        titleLabel.text = title
    }
    
    func insertBody(_ text: String?) {
        guard let text else { return }
        bodyTextView.text = text

    }
    
    
    func insertImage(image:UIImage?) {
        guard let image else { return }
        bodyImageView.image = image
        bodyImageView.isHidden = false
        
        var bound = bodyImageView.bounds
        bound = bound.insetBy(dx: -4, dy: 0)
        
        bodyTextView.textContainer.exclusionPaths = [UIBezierPath(rect: bound)]
    }
    
    func insertAuthor(author: String?){
        guard let author else {
            return
        }
        authorLabel.text = author
    }
    
}


extension NewsListCell{
    
    private func makeContainerConstraints(){
        let constraints = [
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    private func makeTitleConstraints() {
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    private func makeAuthorConstraints(){
        let constraints = [
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    private func makeTextConstraints() {
        let constraints = [
            bodyTextView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            bodyTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyTextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            bodyTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 10)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func makeTextImageConstraints(){
        let constraints = [
            bodyImageView.topAnchor.constraint(equalTo: bodyTextView.topAnchor,
                                               constant: bodyTextView.textContainerInset.top),
            bodyImageView.leadingAnchor.constraint(equalTo: bodyTextView.leadingAnchor),
            bodyImageView.widthAnchor.constraint(equalToConstant: 186),
            bodyImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 150)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func makeSizeViewConstraints(){
       
        if !bodyImageView.isHidden &&
           bodyImageView.frame.height > bodyTextView.frame.height {
            sizeViewTopTextConstraint.isActive = false
            sizeViewTopImageConstraint.isActive = true
        }else{
            sizeViewTopImageConstraint.isActive = false
            sizeViewTopTextConstraint.isActive = true
        }
    }

}
