module L1
  class List
    attr_accessor :head

    def initialize(val)
      @head = Node.new(val)
    end

    def add(val)
      last.next = Node.new(val)
    end

    def merge_without_repeats(another_list)
      current_1 = head
      current_2 = another_list.head
      while !(current_1.next.nil? || current_2.next.nil?)
        add(current_2.val) unless contain?(current_2.val)
      end
    end

    def last
      last = head
      last = last.next while !last.next.nil?
    end

    private

    def contain?(num)
      current = head
      while !current.next.nil?
        return true if current.val == num
        current = current.next
      end
      false
    end
  end
end