//
//  CommentsViewController.swift
//  Eyulingo
//
//  Created by 法好 on 2019/7/22.
//  Copyright © 2019 yuetsin. All rights reserved.
//

import Alamofire
import Alamofire_SwiftyJSON
import Loaf
import SwiftyJSON
import UIKit

class CommentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CommentsRefreshDelegate {
    func refreshComments() {
        loadComments()
        Loaf("评论成功。", state: .success, sender: self).show()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsBody.count
    }

    @IBAction func dismissMe(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsCell", for: indexPath)
        let commentsObject = commentsBody[indexPath.row]
        cell.textLabel?.text = "“\(commentsObject.userName ?? "未知用户")”给出 \(commentsObject.commentStars ?? 5) 颗星"
        cell.detailTextLabel?.text = commentsObject.commentContents ?? "评论内容"
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        checkHiddenOrNot()
        disableStars()
        // Do any additional setup after loading the view.
        loadComments()
    }

    var contentType: CommentType?
    var storeId: Int?
    var goodsId: Int?

    var starPeopleNumber: Int?

    var storeObject: EyStore?
    var goodsObject: EyGoods?

    var commentsBody: [EyComments] = []

    func loadComments() {
        commentsBody.removeAll()
        if contentType == CommentType.storeComments && storeId != nil {
            loadStoreComments()
            titleLabel.text = "针对 “\(storeObject?.storeName ?? "商店 #\(storeId!)")” 的评价"
        } else if contentType == CommentType.goodsComments && goodsId != nil {
            loadGoodsComments()
            titleLabel.text = "针对 “\(goodsObject?.goodsName ?? "商品 #\(goodsId!)")” 的评价"
        }
    }

    func checkHiddenOrNot() {
        if commentsBody.count == 0 {
            noContentIndicator.isHidden = false
            commentsTableView.isHidden = true
        } else {
            noContentIndicator.isHidden = true
            commentsTableView.isHidden = false
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "来自消费者的评价"
    }

    func loadStoreComments() {
        var errorStr = "general error"
        let getParams: Parameters = [
            "id": storeId!,
        ]
        Alamofire.request(Eyulingo_UserUri.storeDetailGetUri,
                          method: .get,
                          parameters: getParams)
            .responseSwiftyJSON(completionHandler: { responseJSON in
                if responseJSON.error == nil {
                    let jsonResp = responseJSON.value
                    if jsonResp != nil {
                        if jsonResp!["status"].stringValue == "ok" {
                            self.starPeopleNumber = jsonResp!["star_number"].intValue
                            for commentItem in jsonResp!["comments"].arrayValue {
                                self.commentsBody.append(EyComments(userName: commentItem["username"].stringValue,
                                                                    commentStars: commentItem["star_count"].intValue,
                                                                    commentContents: commentItem["comment_content"].stringValue))
                            }
                            self.checkHiddenOrNot()
                            self.updateStars()
                            self.commentsTableView.reloadData()
                            return
                        } else {
                            errorStr = jsonResp!["status"].stringValue
                        }
                    } else {
                        errorStr = "bad response"
                    }
                } else {
                    errorStr = "no response"
                }
                Loaf("加载评论失败。服务器报告了一个 “\(errorStr)” 错误", state: .error, sender: self).show()
            })
        NSLog("request ended with " + errorStr)
    }

    func loadGoodsComments() {
        var errorStr = "general error"
        let getParams: Parameters = [
            "id": goodsId!,
        ]
        Alamofire.request(Eyulingo_UserUri.goodDetailGetUri,
                          method: .get,
                          parameters: getParams)
            .responseSwiftyJSON(completionHandler: { responseJSON in
                if responseJSON.error == nil {
                    let jsonResp = responseJSON.value
                    if jsonResp != nil {
                        if jsonResp!["status"].stringValue == "ok" {
                            self.starPeopleNumber = jsonResp!["star_number"].intValue
                            for commentItem in jsonResp!["comments"].arrayValue {
                                self.commentsBody.append(EyComments(userName: commentItem["username"].stringValue,
                                                                    commentStars: commentItem["star_count"].intValue,
                                                                    commentContents: commentItem["comment_content"].stringValue))
                            }
                            self.checkHiddenOrNot()
                            self.updateStars()
                            self.commentsTableView.reloadData()
                            return
                        } else {
                            errorStr = jsonResp!["status"].stringValue
                        }
                    } else {
                        errorStr = "bad response"
                    }
                } else {
                    errorStr = "no response"
                }
                Loaf("加载评论失败。服务器报告了一个 “\(errorStr)” 错误", state: .error, sender: self).show()
            })
        NSLog("request ended with " + errorStr)
    }

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var commentPeopleCountLabel: UILabel!

    @IBOutlet var scoreLabel: UILabel!

    @IBOutlet var noContentIndicator: UILabel!

    @IBOutlet var starOne: UIImageView!
    @IBOutlet var starTwo: UIImageView!
    @IBOutlet var starThree: UIImageView!
    @IBOutlet var starFour: UIImageView!
    @IBOutlet var starFive: UIImageView!

    @IBOutlet var commentsTableView: UITableView!

    @available(iOS 13.0, *)
    func updateStarValue(value: Double) {
        if value >= 5.0 {
            starOne.image = UIImage(systemName: "star.fill")
            starTwo.image = UIImage(systemName: "star.fill")
            starThree.image = UIImage(systemName: "star.fill")
            starFour.image = UIImage(systemName: "star.fill")
            starFive.image = UIImage(systemName: "star.fill")
        } else if value >= 4.5 {
            starOne.image = UIImage(systemName: "star.fill")
            starTwo.image = UIImage(systemName: "star.fill")
            starThree.image = UIImage(systemName: "star.fill")
            starFour.image = UIImage(systemName: "star.fill")
            starFive.image = UIImage(systemName: "star.lefthalf.fill")
        } else if value >= 4.0 {
            starOne.image = UIImage(systemName: "star.fill")
            starTwo.image = UIImage(systemName: "star.fill")
            starThree.image = UIImage(systemName: "star.fill")
            starFour.image = UIImage(systemName: "star.fill")
            starFive.image = UIImage(systemName: "star")
        } else if value >= 3.5 {
            starOne.image = UIImage(systemName: "star.fill")
            starTwo.image = UIImage(systemName: "star.fill")
            starThree.image = UIImage(systemName: "star.fill")
            starFour.image = UIImage(systemName: "star.lefthalf.fill")
            starFive.image = UIImage(systemName: "star")
        } else if value >= 3.0 {
            starOne.image = UIImage(systemName: "star.fill")
            starTwo.image = UIImage(systemName: "star.fill")
            starThree.image = UIImage(systemName: "star.fill")
            starFour.image = UIImage(systemName: "star")
            starFive.image = UIImage(systemName: "star")
        } else if value >= 2.5 {
            starOne.image = UIImage(systemName: "star.fill")
            starTwo.image = UIImage(systemName: "star.fill")
            starThree.image = UIImage(systemName: "star.lefthalf.fill")
            starFour.image = UIImage(systemName: "star")
            starFive.image = UIImage(systemName: "star")
        } else if value >= 2.0 {
            starOne.image = UIImage(systemName: "star.fill")
            starTwo.image = UIImage(systemName: "star.fill")
            starThree.image = UIImage(systemName: "star")
            starFour.image = UIImage(systemName: "star")
            starFive.image = UIImage(systemName: "star")
        } else if value >= 1.5 {
            starOne.image = UIImage(systemName: "star.fill")
            starTwo.image = UIImage(systemName: "star.lefthalf.fill")
            starThree.image = UIImage(systemName: "star")
            starFour.image = UIImage(systemName: "star")
            starFive.image = UIImage(systemName: "star")
        } else {
            starOne.image = UIImage(systemName: "star.fill")
            starTwo.image = UIImage(systemName: "star")
            starThree.image = UIImage(systemName: "star")
            starFour.image = UIImage(systemName: "star")
            starFive.image = UIImage(systemName: "star")
        }
    }

    func disableStars() {
        scoreLabel.text = "无评分"
        commentPeopleCountLabel.text = "由于评分人数不足，无法显示评分。"
        if #available(iOS 13.0, *) {
            starOne.image = UIImage(systemName: "star.slash")
            starTwo.image = UIImage(systemName: "star.slash")
            starThree.image = UIImage(systemName: "star.slash")
            starFour.image = UIImage(systemName: "star.slash")
            starFive.image = UIImage(systemName: "star.slash")
        }
    }

    func updateStars() {
        if starPeopleNumber == nil || starPeopleNumber == 0 || commentsBody.count == 0 {
            if #available(iOS 13.0, *) {
                disableStars()
            }
            return
        }
        commentPeopleCountLabel.text = "\(starPeopleNumber ?? 0) 名用户评分的平均值"
        var totalStarCount: Double = 0.0
        for commentItem in commentsBody {
            totalStarCount += Double(commentItem.commentStars ?? 0)
        }
        let averageStar = totalStarCount / Double(starPeopleNumber ?? 1)
        if averageStar < 0.0 || averageStar > 5.0 {
            disableStars()
            return
        }
        scoreLabel.text = String(format: "%.1f 分", averageStar)
        if #available(iOS 13.0, *) {
            updateStarValue(value: averageStar)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */

    @IBAction func submitComments(_ sender: UIMenuItem) {
        let destinationStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "SubmitCommentsVC") as! SubmitCommentsViewController
        destinationViewController.commentType = contentType
        destinationViewController.goodsId = goodsId
        destinationViewController.goodsName = goodsObject?.goodsName
        destinationViewController.storeId = storeId
        destinationViewController.storeName = storeObject?.storeName
        destinationViewController.delegate = self
        present(destinationViewController, animated: true, completion: nil)
        // SubmitCommentsVC
    }
}

enum CommentType {
    case storeComments
    case goodsComments
    case ordersComments
}
