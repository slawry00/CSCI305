from linked_list import *
def main():
    my_list = empty_list()
    max_num = 11
    my_list = add(my_list, 0, 3)
    my_list = add(my_list, 0, -2)
    my_list = add(my_list, 0, 1)
    my_list = add(my_list, 0, -3)
    my_list = add(my_list, 0, 5)
    my_list = add(my_list, 0, -3)
    my_list = add(my_list, 0, 4)
    my_list = add(my_list, 0, -2)

    print(my_list)
    print(find_max_cons(my_list))

def sum_list(Anylist):
    if Anylist is None:
        return 0
    else:
        return Anylist.first + sum_list(Anylist.rest)

def find_max_cons(Anylist):
    if Anylist is None:
        return -10000 #symbolically = -infinity
    else:
        return max(cons_helper(Anylist.first, Anylist.rest),
                   find_max_cons(Anylist.rest)) #consec substrings beginning with next element

# finds the greatest consecutive substring beginning with the first element
def cons_helper(c_sum, Anylist):
    if Anylist is None:
        return c_sum
    else:
        return max(c_sum, cons_helper(c_sum+Anylist.first, Anylist.rest))
        # returns the greater value between the current cumulative sum and the next one.
        # by "next one" I mean when it's unwinding the recursive calls (so technically previous)
        # aka 10 10 5 5 5 would compare 35 to 30, then 35 to 25, then 35 to 20, then 35 to 10
        # happens at each recursive depth, so it gets all lengths that the cumulative sum can be


if __name__ == "__main__":
    main()
