//
//  ViewController.swift
//  RxTapTest
//
//  Created by NHN on 2022/07/07.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  private let disposeBag = DisposeBag()

  @IBOutlet weak var debounceButton: UIButton!
  @IBOutlet weak var throttleButton: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()

    debounceButton.rx.tap
      .debounce(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.instance)
      .subscribe(onNext: {
        print("debounceButton.rx.tap")
      })
      .disposed(by: disposeBag)

    throttleButton.rx.tap
      .throttle(RxTimeInterval.milliseconds(300), latest: false, scheduler: MainScheduler.instance)
      .subscribe(onNext: {
        print("throttleButton.rx.tap")
      })
      .disposed(by: disposeBag)
  }
}

