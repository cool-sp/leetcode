//
//  0143.reorderList.swift
//  AllProblems
//
//  Created by liuning on 2020/12/24.
//

import Foundation

func reorderList(_ head: ListNode?) {
    var slow = head
    var fast = head
    var prev: ListNode? = nil

    while slow != nil && fast != nil {
        prev = slow
        slow = slow?.next
        fast = fast?.next?.next
    }

    prev?.next = nil

    let list1 = head
    let list2 = reverseList(slow)
    mergeList(list1, list2)
}

func reverseList(_ head: ListNode?) -> ListNode? {
    guard head != nil else { return nil }

    let dummy = ListNode()
    dummy.next = head

    var curr = head?.next
    head?.next = nil

    while curr != nil {
        let temp = curr?.next
        curr?.next = dummy.next
        dummy.next = curr
        curr = temp
    }

    return dummy.next
}

func mergeList(_ list1: ListNode?, _ list2: ListNode?) {
    let dummy = ListNode()
    var curr: ListNode? = dummy

    var next1 = list1
    var next2 = list2

    while next1 != nil && next2 != nil {
        let temp1 = next1?.next
        let temp2 = next2?.next

        curr?.next = next1
        next1?.next = next2
        curr = next2

        next1 = temp1
        next2 = temp2
    }

    if next1 != nil { curr?.next = next1 }
    if next2 != nil { curr?.next = next2 }
}


//#include <string>
//#include <vector>
//#include <deque>
//#include <unordered_map>
//using namespace std;
//
//ListNode* revserList(ListNode* head) {
//    if(!head) return nullptr;
//
//    ListNode* dummy = new ListNode();
//    dummy->next = head;
//
//    ListNode* curr = head->next;
//    head->next = nullptr;
//
//    while(curr) {
//        ListNode* temp = curr->next;
//        curr->next = dummy->next;
//        dummy->next = curr;
//        curr = temp;
//    }
//
//    ListNode* res = dummy->next;
//    delete dummy;
//    return res;
//}
//
//ListNode* mergeList(ListNode* list1, ListNode* list2) {
//    ListNode* dummy = new ListNode();
//    ListNode* curr = dummy;
//
//    ListNode* next1 = list1;
//    ListNode* next2 = list2;
//    while(next1 && next2) {
//        ListNode* temp1 = next1->next;
//        ListNode* temp2 = next2->next;
//
//        curr->next = next1;
//        next1->next = next2;
//        curr = next2;
//
//        next1 = temp1;
//        next2 = temp2;
//    }
//
//    if(next1) { curr->next = next1; }
//    if(next2) { curr->next = next2; }
//
//    ListNode* res = dummy->next;
//    delete dummy;
//    return res;
//}
//
//void reorderList(ListNode* head) {
//    ListNode* slow = head;
//    ListNode* fast = head;
//    ListNode* prev = nullptr;
//
//    while(slow && fast) {
//        prev = slow;
//        slow = slow->next;
//
//        fast = fast->next;
//        if (fast) fast = fast->next;
//    }
//
//    if (prev) prev->next = nullptr;
//
//    ListNode* list1 = head;
//    ListNode* list2 = revserList(slow);
//    mergeList(list1, list2);
//}
