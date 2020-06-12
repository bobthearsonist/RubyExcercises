#Given 1->2->3->4, you should return the list as 2->1->4->3.
require 'swap_nodes_in_pairs'

describe do
    it "should swap pairs" do
        linked_list = ListNode.new(1,ListNode.new(2,ListNode.new(3,ListNode.new(4,nil))))
        expected_list = ListNode.new(2,ListNode.new(1,ListNode.new(4,ListNode.new(3,nil))))

        expected = LinkedList.new(expected_list)
        actual = LinkedList.new(swap_pairs(linked_list))
        expect(actual).to be ==(expected)
    end    
        
    it "returns nil if given nil list" do
        nil_list = nil
        expect(swap_pairs(nil_list)).to be nil
    end

    it "returns head if single item list" do
        single_list = ListNode.new(0,nil) 
        expect(LinkedList.new(swap_pairs(single_list))).to be ==(LinkedList.new(ListNode.new(0,nil)))
    end
end