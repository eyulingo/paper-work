//
//  GoodsDetailViewController.swift
//  Eyulingo
//
//  Created by 法好 on 2019/7/17.
//  Copyright © 2019 yuetsin. All rights reserved.
//

import TagListView
import UIKit

class GoodsDetailViewController: UIViewController, DismissMyselfDelegate, TagListViewDelegate, SuicideDelegate, WriteBackTagsDelegate {
    func writeTags(tags: [String]) {
        tagListView.removeAllTags()
        if tags.count != 0 {
            tagListView.addTags(tags)
        } else {
            tagListView.isHidden = true
        }
    }
    
    func dismissMe() {
        dismiss(animated: true, completion: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        // if the delegate isn't null (raised by cart), tell him to refresh it
        // shortcut evaluate
        if refreshCartDelegate != nil && CartRefreshManager.shouldCartRefresh() {
            refreshCartDelegate!.refreshCart()
        }
    }

    var openedByStoreId: Int?
    var refreshCartDelegate: CartRefreshDelegate?

    @IBOutlet var tagListView: TagListView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        goodsObject?.getCoverAsync(handler: { image in
            self.fadeIn(image: image, handler: nil)
        })

        tagListView.delegate = self
    }

    @IBAction func dismissMe(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    var goodsObject: EyGoods?

    func accessLargeImage() {
        if imageViewField.image == nil {
            return
        }
        let destinationStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "ImagePreviewVC") as! ImagePreviewViewController

        destinationViewController.mainImage = imageViewField.image
        destinationViewController.promptText = "“\(goodsObject?.goodsName ?? "商品")” 图像"
        present(destinationViewController, animated: true, completion: nil)
    }

    @IBAction func accessLargeImageButtonTapped(_ sender: UIButton) {
        accessLargeImage()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if contentVC == nil {
            if segue.identifier == "GoodsDetailSegue" {
                contentVC = segue.destination as? GoodsDetailTableViewController
                contentVC?.goodsObject = goodsObject
                contentVC?.delegate = self
                contentVC?.writeBackTagsDelegate = self
                contentVC?.openedByStoreId = openedByStoreId
            }
        }
    }

    @IBAction func openComments(_ sender: UIBarButtonItem) {
        let destinationStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "CommentsVC") as! CommentsViewController
        destinationViewController.contentType = CommentType.goodsComments
        destinationViewController.goodsObject = goodsObject
        destinationViewController.goodsId = goodsObject?.goodsId
        present(destinationViewController, animated: true, completion: nil)
    }

    @IBOutlet var imageViewField: UIImageView!

    var contentVC: GoodsDetailTableViewController?

    func fadeIn(image: UIImage, duration: Double = 0.25, handler: (() -> Void)?) {
        imageViewField.alpha = 0.0
        imageViewField.image = image
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
            self.imageViewField.alpha = 1.0
        }, completion: { _ in
            self.imageViewField.alpha = 1.0
            handler?()
        })
    }

    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        //        self.navigationController?.popToRootViewController(animated: true)
        killMe(lastWord: title)
    }

    var suicideDelegate: SuicideDelegate?

    func killMe(lastWord: String) {
        dismiss(animated: true, completion: {
            self.suicideDelegate?.killMe(lastWord: lastWord)
        })
    }
}

protocol SuicideDelegate {
    func killMe(lastWord: String) -> Void
}

protocol CartRefreshDelegate {
    func refreshCart() -> Void
}
