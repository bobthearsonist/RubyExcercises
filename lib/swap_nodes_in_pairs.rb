#Given a linked list, swap every two adjacent nodes and return its head.

#You may not modify the values in the list's nodes, only nodes itself may be changed.

# Definition for singly-linked list.
class ListNode
    attr_reader :val
    attr_accessor :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
    def ==( other )
        self.val == other.val &&
        self.next == other.next
    end
end

class LinkedList
    attr_reader :head
    def initialize(head)
        @head = head
    end
    
    def ==( other )
        curSelf = @head
        curOther = other.head
        loop do
            return false if curOther != curSelf # implicit check of length
            break if curSelf.next.nil?
            curOther = curOther.next
            curSelf = curSelf.next
        end
        true
    end

    def to_s
        s="["
        cur = self.head
        loop do
            s+=cur.val.to_s
            break if cur.next.nil?
            s+=","
            cur = cur.next
        end
        s+="]"
        return s
    end
end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
    return head if head.nil?
    return head if head.next.nil?
    n1 = head
    head = head.next
    n2 = n1.next
    prev = n1
    loop do
        #swap
        prev.next = n2 unless prev == head
        n1.next = n2.next
        n2.next = n1
        #evaluate
        break if n1.next.nil? || n1.next.next.nil?
        #advance
        prev = n1
        n1=n1.next
        n2=n1.next
    end
    head
end