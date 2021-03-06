//
//  DemoTableViewController.swift
//  ChatMessageDemoProject
//
//  Created by liufengting on 16/2/28.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

import UIKit
import FTIndicator

class DemoTableViewController: FTChatMessageTableViewController,FTChatMessageAccessoryViewDelegate,FTChatMessageAccessoryViewDataSource,FTChatMessageRecorderViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(self.addNewIncomingMessage)), animated: true)
        
        messageRecordView.recorderDelegate = self
        messageAccessoryView.setupWithDataSource(self , accessoryViewDelegate : self)
        
        
        messageArray = self.loadDefaultMessages()
    }
    
    
    //MARK: - addNewIncomingMessage -
    
    func addNewIncomingMessage() {
        
        let message8 = FTChatMessageModel(data: "New Message added, try something else.", time: "4.12 22:42", from: sender1, type: .Text)
        self.addNewMessage(message8)

    }

    func loadDefaultMessages() -> [FTChatMessageModel] {
        let message1 = FTChatMessageModel(data: "最近有点无聊，抽点时间写了这个聊天的UI框架。", time: "4.12 21:09:50", from: sender1, type: .Text)
        let message2 = FTChatMessageModel(data: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", time: "4.12 21:09:51", from: sender2, type: .Audio)
        let message3 = FTChatMessageModel(data: "纯Swift编写，目前只写了纯文本消息，后续会有更多功能，图片视频语音定位等。这一版本还有很多需要优化，希望可以改成一个易拓展的方便大家使用，哈哈哈哈", time: "4.12 21:09:52", from: sender1, type: .Image)
        let message4 = FTChatMessageModel(data: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", time: "4.12 21:09:53", from: sender2, type: .Video)
        let message5 = FTChatMessageModel(data: "文字背景不是图片，是用贝塞尔曲线画的，效率应该不高，后期优化", time: "4.12 21:09:53", from: sender1, type: .Text)
        let message6 = FTChatMessageModel(data: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", time: "4.12 21:09:54", from: sender2, type: .Text)
        let message7 = FTChatMessageModel(data: "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈", time: "4.12 21:09:55", from: sender1, type: .Text)
        let message8 = FTChatMessageModel(data: "https://raw.githubusercontent.com/liufengting/liufengting.github.io/master/img/macbookpro.jpg", time: "4.12 21:09:56", from: sender3, type: .Image)
        
        let array = [message1,message2,message3,message4,message5,message6,message7,message8]
        
        return array;
        
    }
    
    
    func getAccessoryItemTitleArray() -> [String] {
        return ["Alarm","Camera","Contacts","Mail","Messages","Music","Phone","Photos","Settings","VideoChat","Videos","Weather"]
    }

    
    //MARK: - FTChatMessageAccessoryViewDataSource -
    
    func ftChatMessageAccessoryViewModelArray() -> [FTChatMessageAccessoryViewModel] {
        var array : [FTChatMessageAccessoryViewModel] = []
        let titleArray = self.getAccessoryItemTitleArray()
        for i in 0...titleArray.count-1 {
            let string = titleArray[i]
            array.append(FTChatMessageAccessoryViewModel.init(title: string, iconImage: UIImage(named: string)!))
        }
        return array
    }

    //MARK: - FTChatMessageAccessoryViewDelegate -
    
    func ftChatMessageAccessoryViewDidTappedOnItemAtIndex(index: NSInteger) {
        print("tapped at accessory view at index : \(index)")
        FTIndicator.showInfoWithMessage("you tapped index: \(index)")
    }
    
    
    
    
    
    
    
    //MARK: - FTChatMessageRecorderViewDelegate -
    
    func ft_chatMessageRecordViewDidStartRecording(){
        print("Start recording...")
        FTIndicator.showProgressWithmessage("Recording...")
    }
    func ft_chatMessageRecordViewDidCancelRecording(){
        print("Recording canceled.")
        FTIndicator.dismissProgress()
    }
    func ft_chatMessageRecordViewDidStopRecording(duriation: NSTimeInterval, file: NSData?){
        print("Recording ended!")
        FTIndicator.showSuccessWithMessage("Record done.")
    }
    
    
    
    

}
