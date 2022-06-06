require "byebug"

class Array
    def my_each(&prc)
        i=0
        while i< self.length
            prc.call(self[i])
            i+=1
        end
        self
    end

    # arr =  [1,2,3,4,5,6]

    # arr.my_each {|ele| ele}
    

    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if prc.call(ele)
        end
        new_arr
    end

#  a = [1, 2, 3]
#  p   a.my_select { |num| num > 1 } # => [2, 3]
#  p   a.my_select { |num| num == 4 } # => []

    def my_reject(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if !prc.call(ele)
        end
        new_arr

    end

    a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]
    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        true
    end

    # p a = [1, 2, 3]
    # p a.my_any? { |num| num > 1 } # => true
    # p a.my_any? { |num| num == 4 } # => false
    # p a.my_all? { |num| num > 1 } # => false
    # p a.my_all? { |num| num < 4 } # => true

    def my_flatten()
        new_arr = []
        self.my_each do |ele|
            if !ele.is_a?(Array)
                new_arr << ele
            else
                new_arr += ele
            end
        end
        if new_arr.not_flattened?
            new_arr.my_flatten
        else
            new_arr
        end
    end

    def not_flattened?
        self.my_any? do |ele|
            ele.is_a?(Array)
        end
        
    end

    # p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

    def my_zip(*args)
        all_arrs =[]
        all_arrs << self
        all_arrs << args.to_a
        num_arrs = args.count + 1
        length = self.length
        new_arr = Array.new(length) {Array.new(num_arrs)}
     
        (0...length-1).my_each do |index_1|
            (0...length-1).my_each do |index_2|
                new_arr[index_1][index_2] << all_arrs[index_1][index_2]
            end
        end
        new_arr
    end

    # a = [ 4, 5, 6 ]
    # b = [ 7, 8, 9 ]
    # p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
    # p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
    # [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

    # c = [10, 11, 12]
    # d = [13, 14, 15]
    # p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

    #I don't know how to 
        def my_rotate(num=1)
            arr = self
            num.times do 
                ele = arr.shift
                arr << ele
            end
            arr

        end
        # a = [ "a", "b", "c", "d" ]
        # p a.my_rotate         #=> ["b", "c", "d", "a"]
        # p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
        # a = [ "a", "b", "c", "d" ]
        # p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
        # p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

        def my_join(sep="")
            str = ""
            self.each do |ele|
                str += ele + sep
            end
            str
        end
        # a = [ "a", "b", "c", "d" ]
        # p a.my_join         # => "abcd"
        # p a.my_join("$")    # => "a$b$c$d"

        def my_reverse
            new_arr = []
            length = self.length 
            (1..length).each do |idx|
                new_arr << self[idx*-1]
            end
            new_arr
        end

        p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
        p [ 1 ].my_reverse               #=> [1]
   
end