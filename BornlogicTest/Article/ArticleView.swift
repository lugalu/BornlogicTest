//Created by Lugalu on 14/05/24.

import UIKit


class ArticleView: UIScrollView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .accent
        label.font = .systemFont(ofSize: 30, weight: .black)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .accent
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .accent
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        let fontDescriptor = UIFont.systemFont(ofSize: 24,
                                     weight: .light)
            .fontDescriptor
            .withSymbolicTraits(.traitItalic)!
        textView.font = UIFont(descriptor: fontDescriptor, size: 18)
        textView.textColor = .accent
        textView.backgroundColor = .clear
       
        return textView
    }()
    
    lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.font = .systemFont(ofSize: 24, weight: .regular)
        textView.textColor = .accent
        textView.backgroundColor = .clear
        
        return textView
    }()
    
    lazy var urlTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.dataDetectorTypes = .link
        textView.font = .systemFont(ofSize: 24, weight: .regular)
        textView.backgroundColor = .clear
        
        return textView
    }()
    
    
    func setup(content: NewsEntity){
        backgroundColor = .appBackground
        assingContent(content: content)
        addViews()
        makeConstraints()
    }
    
    private func assingContent(content: NewsEntity){
        if let title = content.title {
            titleLabel.text = title
        }
        
        authorLabel.text = "Autor: " + (content.author ?? "unknow")
        
        if let date = content.publishedAt {
            dateLabel.text = date.formatted(.dateTime)
        }
        if let image = content.image {
            imageView.image = image
        }
        if let descriptionText = content.description {
            descriptionTextView.text = descriptionText
        }
        if let contentText = content.content {
            contentTextView.text = contentText
        }
        
        if let url = content.url {
            urlTextView.text = url.absoluteString
        }
        
        
        
    }
    
    
    func addViews(){
        self.addSubview(titleLabel)
        self.addSubview(authorLabel)
        self.addSubview(dateLabel)
        self.addSubview(imageView)
        self.addSubview(descriptionTextView)
        self.addSubview(contentTextView)
        self.addSubview(urlTextView)
        
    }
    
    func makeConstraints(){
        makeTitleLabelConstraints()
        makeAuthorLabelConstraints()
        makeDateLabelConstraints()
        makeImageViewConstraints()
        makeDescriptionConstraints()
        makeContentConstraints()
        makeURLConstraints()
    }
}


extension ArticleView{
    private func makeTitleLabelConstraints(){
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor, constant: 8),
            titleLabel.leadingAnchor
                .constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor
                .constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func makeAuthorLabelConstraints(){
        let constraints = [
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -4)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func makeDateLabelConstraints(){
        let constraints = [
            dateLabel.topAnchor.constraint(equalTo: authorLabel.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 4),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func makeImageViewConstraints(){
        let height: CGFloat = imageView.image != nil ? 200 : 1
        let constraints = [
            imageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            imageView.heightAnchor.constraint(lessThanOrEqualToConstant: height),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func makeDescriptionConstraints() {
        let constraints = [
            descriptionTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            descriptionTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 8),
            descriptionTextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -8)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func makeContentConstraints() {
        let constraints = [
            contentTextView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 8),
            contentTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            contentTextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func makeURLConstraints() {
        let top: UIView
        
        if contentTextView.text != nil && !contentTextView.text.isEmpty {
            top = contentTextView
        }else if descriptionTextView.text != nil  && !descriptionTextView.text.isEmpty {
            top = descriptionTextView
        }else if imageView.image != nil {
            top = imageView
        } else {
            top = authorLabel
        }
        
        
        
        let constraints = [
            urlTextView.topAnchor.constraint(equalTo: top.bottomAnchor, constant: 8),
            urlTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            urlTextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            urlTextView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
