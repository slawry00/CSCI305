#Spencer Lawry
#CPE103
#Lab03
#Instructor: Brian Jones
import math
# An AnyList is either None or a Pair(first, rest) where first can be any type
class Pair:
    def __init__(self, first, rest):
        self.first = first # some value
        self.rest = rest # an AnyList
    def __eq__(self, other):
        return (type(other) == Pair
                and self.first == other.first
                and self.rest == other.rest)
    def __repr__(self):
        if (self.rest != None):
            return "{!r},{!r}".format(self.first, self.rest)
        else:
            return "{!r}".format(self.first)
        #return "Pair({!r}, {!r})".format(self.first, self.rest)


#  -> AnyList
# Returns an empty AnyList
def empty_list():
    return None

# AnyList + int + value -> AnyList
# Returns an Anylist with the given value added at the given index
def add(Anylist, index, value, count=0, is_first=True):
    if is_first and index < 0:
        raise IndexError
    elif index == count:
        return Pair(value, Anylist)
    elif Anylist is None:
        raise IndexError
    else:
        return Pair(Anylist.first, add(Anylist.rest, index, value, count+1, False))

# AnyList -> int
# returns the length of the list
def length(Anylist):
    if Anylist == None:
        return 0
    else:
        return 1 + length(Anylist.rest)

# Anylist + int -> Value
# returns the value at the given index
def get(Anylist, index, count=0, is_first=True):
    if is_first and (index < 0 or Anylist is None):
        raise IndexError
    elif index == count:
        return Anylist.first
    elif Anylist.rest is None:
        raise IndexError
    else:
        return get(Anylist.rest, index, count+1, False)

# AnyList + int + value -> AnyList
# Returns an Anylist with the given value substituted at the given index
def set(Anylist, index, value, count=0, is_first=True):
    if is_first and (index < 0 or Anylist is None):
        raise IndexError
    elif index == count:
        return Pair(value, Anylist.rest)
    elif Anylist.rest is None:
        raise IndexError
    else:
        return Pair(Anylist.first, set(Anylist.rest, index, value, count+1, False))

# AnyList + int -> tuple(value, AnyList)
# removes the value at the given index and returns a tuple of the element previously at
# that index and the resulting list
def remove(Anylist, index, count=0, is_first=True):
    if is_first and (index < 0 or Anylist is None):
        raise IndexError #get() will raise the out of bounds error
    elif is_first:
        return (get(Anylist, index), remove(Anylist, index, count, False))
    elif index == count:
        return Anylist.rest
    else:
        return Pair(Anylist.first, remove(Anylist.rest, index, count+1, False))

# List + function -> None
# applies the provided function to each value in the list (left->right)
def foreach(Anylist, func):
    if Anylist is None:
        return
    else:
        func(Anylist.first)
        foreach(Anylist.rest, func)

# AnyList + function -> AnyList
# returns a sorted list according to the given "less-than" function
def sort(Anylist, compare, new_list=empty_list()):
    if Anylist is None:
        return new_list
    else:
        new_list = sort_helper(Anylist.first, new_list, compare) # put Anylist value in new_list
        return sort(Anylist.rest, compare, new_list)

# value + AnyList + function -> AnyList
# compares a value from main list to all values in the developing list and inserts it in the
# correct sorted location. Returns the new list.
def sort_helper(cur, new_list, compare):
    if new_list is None:  # hit end of new_list, put cur at end
        return Pair(cur, None)
    elif not compare(cur, new_list.first): # found smaller value, keep moving
        return Pair(new_list.first, sort_helper(cur, new_list.rest, compare))
    else:
        return Pair(cur, new_list) # found larger value, put cur in front of remaining list

# int + int -> bool
# returns whether num1 > num2
def compare_tester(num1, num2):
    return num1 < num2

class Iterator:
    def __init__(self, list):
        self.list = list

    def __eq__(self, other):
        return (type(other) == Iterator
                and self.list == other.list)
    def __repr__(self):
        return "Iterator({!r})".format(self.list)

# Anylist -> Iterator
# returns an Iterator on the linked_list
def object_iterator(Anylist):
    return Iterator(Anylist)

# Iterator -> Bool
# returns if the Iterator has another value to return from the linked_list
def has_next(it):
    if it.list is None:
        return False
    else:
        return True
# Iterator -> Value
# returns the next value in the iteration sequence
def next(it):
    if not has_next(it):
        raise StopIteration
    else:
        val = it.list.first
        it.list = it.list.rest
        return val
# Anylist -> value
# yields the values of the list
def yield_iterator(Anylist):
    if Anylist is None:
        return None
    else:
        yield Anylist.first
        yield from yield_iterator(Anylist.rest)

# AnyList + Value + func -> Linked List
# inserts the value into the sorted linked list using the given less-than function and returns it
def insert_sorted(my_list, value, compare):
    if my_list is None:
        return Pair(value, None) #hit end, put at end
    elif compare(value, my_list.first):
        return Pair(value, my_list) #found spot, put here
    else:
        return Pair(my_list.first, insert_sorted(my_list.rest, value, compare))















