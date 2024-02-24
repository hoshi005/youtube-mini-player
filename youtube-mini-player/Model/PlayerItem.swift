//
//  PlayerItem.swift
//  youtube-mini-player
//
//  Created by Susumu Hoshikawa on 2024/02/24.
//

import Foundation

/// player item model
let dummyDescription: String = "親譲りの無鉄砲で小供の時から損ばかりしている。小学校に居る時分学校の二階から飛び降りて一週間ほど腰を抜かした事がある。なぜそんな無闇をしたと聞く人があるかも知れぬ。別段深い理由でもない。新築の二階から首を出していたら、同級生の一人が冗談に、いくら威張っても、そこから飛び降りる事は出来まい。弱虫やーい。と囃したからである。小使に負ぶさって帰って来た時、おやじが大きな眼をして二階ぐらいから飛び降りて腰を抜かす奴があるかと云ったから、この次は抜かさずに飛んで見せますと答えた。（青空文庫より）"

struct PlayerItem: Identifiable, Equatable {
    let id: UUID = .init()
    var title: String
    var author: String
    var image: String
    var description: String = dummyDescription
}

var items: [PlayerItem] = [
    .init(title: "Apple Vision Pro", author: "hoshi005", image: "Pic 1"),
    .init(title: "リコリス・リコイル 感想戦", author: "hoshi005", image: "Pic 2"),
    .init(title: "Vivy OP ノンクレジット", author: "hoshi005", image: "Pic 3"),
    .init(title: "葬送のフリーレン 第2シーズンPV", author: "hoshi005", image: "Pic 4"),
    .init(title: "ダンジョン飯 OP/ED ノンクレジットバージョン", author: "hoshi005", image: "Pic 5"),
    .init(title: "ドラム叩いてみた 星座になれたら", author: "hoshi005", image: "Pic 6"),
]
